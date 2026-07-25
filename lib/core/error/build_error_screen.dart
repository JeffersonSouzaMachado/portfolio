import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FriendlyErrorView extends StatelessWidget {
  final FlutterErrorDetails details;

  FriendlyErrorView({super.key, required this.details});

  final _copied = ValueNotifier(false);

  void _copy() {
    Clipboard.setData(
      ClipboardData(text: '${details.exceptionAsString()}\n\n${details.stack}'),
    );

    _copied.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      _copied.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        type: MaterialType.transparency,
        child: Semantics(
          container: true,
          label:
              'Algo deu errado. Reiniciar o aplicativo deve resolver o problema.',
          child: ExcludeSemantics(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onLongPress: _copy,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: _copied,
                    builder: (context, copied, _) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: cs.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              copied
                                  ? Icons.check_rounded
                                  : Icons.priority_high_rounded,
                              color: cs.onPrimary,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Ops! Algo deu errado',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tente reiniciar o aplicativo para resolver o problema.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: cs.onSurfaceVariant),
                          ),
                          const SizedBox(height: 20),
                          if (kDebugMode)
                            FilledButton.icon(
                              onPressed: _copy,
                              style: FilledButton.styleFrom(
                                backgroundColor: copied
                                    ? Colors.green
                                    : cs.primary,
                                foregroundColor: copied
                                    ? Colors.white
                                    : cs.onPrimary,
                              ),
                              icon: Icon(
                                copied
                                    ? Icons.check_circle_outline
                                    : Icons.copy_all_rounded,
                              ),
                              label: Text(
                                copied ? 'Copiado!' : 'Copiar detalhes do erro',
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
