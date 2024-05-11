import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final result1 = useState(null);

    return Scaffold(
      appBar: AppBar(title: const Text('Swift呼び出し')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            //
            _CallSwiftButton(
              label: 'ラベル1',
              fieldText: result1.value,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _CallSwiftButton extends StatelessWidget {
  final String label;
  final String? fieldText;
  final void Function() onPressed;

  const _CallSwiftButton({
    required this.label,
    this.fieldText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// 呼び出し結果フィールド
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Text(fieldText ?? 'no result'),
        ),
        const SizedBox(height: 8),

        /// 呼び出しボタン
        ElevatedButton(
          onPressed: onPressed,
          child: Text(label),
        ),
      ],
    );
  }
}
