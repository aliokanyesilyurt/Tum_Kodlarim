import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurpleAccent,
      ),
      home: const HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Stopwatch _stopwatch = Stopwatch();
  int _lastUs = 0;

  final Random _random = Random();
  final List<_Particle> _particles = <_Particle>[];
  final List<_Rocket> _rockets = <_Rocket>[];

  double _secondsSinceAutoLaunch = 0;

  @override
  void initState() {
    super.initState();
    _stopwatch.start();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..addListener(_onTick);
    _controller.repeat();
  }

  void _onTick() {
    if (!mounted) return;

    final int nowUs = _stopwatch.elapsedMicroseconds;
    final double dt = ((nowUs - _lastUs).clamp(0, 100000) / 1e6).toDouble();
    _lastUs = nowUs;

    if (dt <= 0) return;

    final Size size = MediaQuery.sizeOf(context);

    _secondsSinceAutoLaunch += dt;
    if (_secondsSinceAutoLaunch >= 0.55) {
      _secondsSinceAutoLaunch = 0;
      _spawnRocket(size);
    }

    for (int i = _rockets.length - 1; i >= 0; i--) {
      final _Rocket r = _rockets[i];
      r.age += dt;
      if (r.age >= r.burnTime || r.position.dy <= size.height * 0.18) {
        _spawnExplosion(origin: r.position, colors: _laserColors());
        _rockets.removeAt(i);
        continue;
      }

      r.velocity = Offset(r.velocity.dx * 0.992, r.velocity.dy * 0.992);
      r.velocity += Offset(0, 160) * dt;
      r.position += r.velocity * dt;
    }

    for (int i = _particles.length - 1; i >= 0; i--) {
      final _Particle p = _particles[i];
      p.age += dt;
      if (p.age >= p.life) {
        _particles.removeAt(i);
        continue;
      }

      p.velocity = Offset(p.velocity.dx * 0.985, p.velocity.dy * 0.985);
      p.velocity += Offset(0, 220) * dt;
      p.position += p.velocity * dt;
    }

    setState(() {});
  }

  List<Color> _laserColors() {
    return const <Color>[
      Colors.deepPurpleAccent,
      Colors.purpleAccent,
      Colors.pinkAccent,
      Colors.cyanAccent,
      Colors.lightBlueAccent,
    ];
  }

  void _spawnRocket(Size size) {
    final List<Color> colors = _laserColors();
    final Color color = colors[_random.nextInt(colors.length)];

    final double x = _random.nextDouble() * size.width;
    final Offset origin = Offset(x, size.height + 12);

    final double dx = (-0.6 + _random.nextDouble() * 1.2) * 60;
    final double dy = -(520 + _random.nextDouble() * 240);

    _rockets.add(
      _Rocket(
        position: origin,
        velocity: Offset(dx, dy),
        burnTime: 0.55 + _random.nextDouble() * 0.35,
        color: color,
      ),
    );
  }

  void _spawnExplosion({required Offset origin, required List<Color> colors}) {
    final int count = 34 + _random.nextInt(18);
    for (int i = 0; i < count; i++) {
      final double angle = _random.nextDouble() * pi * 2;
      final double speed = 80 + _random.nextDouble() * 220;
      final Offset velocity = Offset(cos(angle), sin(angle)) * speed;
      final double life = 0.8 + _random.nextDouble() * 0.9;
      final double size = 6 + _random.nextDouble() * 14;
      final Color color = colors[_random.nextInt(colors.length)];

      _particles.add(
        _Particle(
          position: origin,
          velocity: velocity,
          life: life,
          size: size,
          color: color,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double t = _stopwatch.elapsedMilliseconds / 1000.0;

    final double floatY = sin(t * 2.0) * 10;
    final double scale = 1.0 + (sin(t * 2.4 + 0.7) * 0.06);
    final double glow = (sin(t * 3.0) + 1) / 2;

    return Scaffold(
      appBar: AppBar(title: const Text('Deneme Proje')),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _FireworksPainter(
                rockets: _rockets,
                particles: _particles,
                background: Colors.grey.shade900,
              ),
            ),
          ),
          Center(
            child: Transform.translate(
              offset: Offset(0, floatY),
              child: Transform.scale(
                scale: scale,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    child: Stack(
                      children: [
                        Text(
                          'SUDE',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.0,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 7
                                  ..color = Colors.black,
                              ),
                        ),
                        Text(
                          'SUDE',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.0,
                                color: Colors.deepPurpleAccent,
                                shadows: <Shadow>[
                                  Shadow(
                                    blurRadius: 18 + glow * 14,
                                    color: Colors.deepPurpleAccent.withValues(
                                      alpha: 0.55 + glow * 0.30,
                                    ),
                                  ),
                                  Shadow(
                                    blurRadius: 30 + glow * 20,
                                    color: Colors.purpleAccent.withValues(
                                      alpha: 0.22 + glow * 0.18,
                                    ),
                                  ),
                                ],
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Rocket {
  _Rocket({
    required this.position,
    required this.velocity,
    required this.burnTime,
    required this.color,
  });

  Offset position;
  Offset velocity;
  final double burnTime;
  double age = 0;
  final Color color;
}

class _Particle {
  _Particle({
    required this.position,
    required this.velocity,
    required this.life,
    required this.size,
    required this.color,
  });

  Offset position;
  Offset velocity;
  final double life;
  double age = 0;
  final double size;
  final Color color;
}

class _FireworksPainter extends CustomPainter {
  _FireworksPainter({
    required this.rockets,
    required this.particles,
    required this.background,
  });

  final List<_Rocket> rockets;
  final List<_Particle> particles;
  final Color background;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = background);

    final Paint glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (final _Rocket r in rockets) {
      final Offset dir = r.velocity.distanceSquared > 0.001
          ? (r.velocity / r.velocity.distance)
          : const Offset(0, -1);
      final Offset tail = r.position - dir * 22;

      glowPaint
        ..color = r.color.withValues(alpha: 0.18)
        ..strokeWidth = 8;
      canvas.drawLine(tail, r.position, glowPaint);

      glowPaint
        ..color = r.color.withValues(alpha: 0.75)
        ..strokeWidth = 2.2;
      canvas.drawLine(tail, r.position, glowPaint);

      final Offset left = r.position - dir * 10 + Offset(-dir.dy, dir.dx) * 6;
      final Offset right = r.position - dir * 10 + Offset(dir.dy, -dir.dx) * 6;
      canvas.drawLine(left, r.position, glowPaint);
      canvas.drawLine(right, r.position, glowPaint);
    }

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    for (final _Particle p in particles) {
      final double k = (p.age / p.life).clamp(0.0, 1.0);
      final double alpha = (1 - k) * (1 - k);
      paint.color = p.color.withValues(alpha: alpha);

      final Offset dir = p.velocity.distanceSquared > 0.001
          ? (p.velocity / p.velocity.distance)
          : const Offset(1, 0);
      final double len = p.size * (1.2 + (1 - k) * 1.4);
      final Offset a = p.position - dir * (len * 0.55);
      final Offset b = p.position + dir * (len * 0.45);

      paint.strokeWidth = 5.5 * alpha;
      paint.color = p.color.withValues(alpha: alpha * 0.18);
      canvas.drawLine(a, b, paint);

      paint.strokeWidth = 1.6 + (1 - k) * 0.9;
      paint.color = p.color.withValues(alpha: alpha);
      canvas.drawLine(a, b, paint);

      paint
        ..strokeWidth = 1.0
        ..color = Colors.white.withValues(alpha: alpha * 0.25);
      canvas.drawCircle(p.position, 1.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _FireworksPainter oldDelegate) => true;
}
