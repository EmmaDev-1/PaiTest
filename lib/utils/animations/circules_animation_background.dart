import 'dart:math' as math; // Solo si deseas usar funciones matemáticas
import 'package:flutter/material.dart';
import 'package:pai/utils/colors.dart';
import 'package:sizer/sizer.dart';

class CirculesAnimationBackground extends StatefulWidget {
  final Widget child;

  const CirculesAnimationBackground({Key? key, required this.child})
    : super(key: key);

  @override
  _CirculesAnimationBackgroundState createState() =>
      _CirculesAnimationBackgroundState();
}

class _CirculesAnimationBackgroundState
    extends State<CirculesAnimationBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circle1Size;
  late Animation<double> _circle2Size;

  // Variables para controlar el desplazamiento "aleatorio"
  double _circle1OffsetX = 0;
  double _circle1OffsetY = 0;
  double _circle2OffsetX = 0;
  double _circle2OffsetY = 0;

  @override
  void initState() {
    super.initState();

    // Duración de un ciclo de la animación (se puede ajustar a gusto)
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 14))
          ..addListener(() {
            setState(() {
              double t = _controller.value; // t varía de 0 a 1
              // Aumentamos el rango del movimiento multiplicando los offsets
              _circle1OffsetX = 120 * math.sin(2 * math.pi * t);
              _circle1OffsetY = 5 * math.cos(2 * math.pi * t);
              _circle2OffsetX = 120 * math.sin(2 * math.pi * t + 1);
              _circle2OffsetY = 5 * math.cos(2 * math.pi * t + 1);
            });
          })
          ..repeat(reverse: true);

    // Animaciones para el tamaño de los círculos
    _circle1Size = Tween<double>(
      begin: 15.0,
      end: 15.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _circle2Size = Tween<double>(
      begin: 15.0,
      end: 15.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Usamos ClipRRect para limitar el área de visualización de la animación al tamaño del botón
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Primer círculo "luminoso"
            AnimatedBuilder(
              animation: _circle1Size,
              builder: (context, child) {
                final circleSize = _circle1Size.value;
                // Posicionándolo hacia la izquierda y arriba, con el nuevo rango de movimiento
                final leftPos =
                    constraints.maxWidth / 2 - circleSize + _circle1OffsetX;
                final topPos =
                    constraints.maxHeight / 2 -
                    circleSize * 1.5 +
                    _circle1OffsetY;
                return Positioned(
                  left: leftPos,
                  top: topPos,
                  child: Container(
                    width: 3.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // Color base invisible (para que solo se vea la sombra)
                      color: const Color.fromARGB(0, 69, 227, 182),
                      // Sombra para efecto "luminoso" con mayor blur y spread
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greenSeafoam,
                          blurRadius: 40, // Blur aumentado
                          spreadRadius: 40, // Rango de sombra mayor
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Segundo círculo "luminoso"
            AnimatedBuilder(
              animation: _circle2Size,
              builder: (context, child) {
                final circleSize = _circle2Size.value;
                // Posicionado hacia la derecha y abajo, con mayor movimiento
                final rightPos =
                    constraints.maxWidth / 2 - circleSize + _circle2OffsetX;
                final bottomPos =
                    constraints.maxHeight / 2 - circleSize + _circle2OffsetY;
                return Positioned(
                  right: rightPos,
                  bottom: bottomPos,
                  child: Container(
                    width: 1.w,
                    height: 1.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(0, 29, 76, 230),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accent,
                          blurRadius:
                              40, // Blur aumentado para un efecto más difuminado
                          spreadRadius: 40, // Mayor rango en el sombreado
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // El widget del botón (o cualquier widget) en el centro
            widget.child,
          ],
        );
      },
    );
  }
}
