import "package:flutter/material.dart";
class DummyScreenForTesting extends StatefulWidget {
  const DummyScreenForTesting({super.key});

  @override
  State<DummyScreenForTesting> createState() => _DummyScreenForTestingState();
}

class _DummyScreenForTestingState extends State<DummyScreenForTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(
        child: Text('Dummy Screen For Testing'),
      ),
      ),
      body: const Center(
        child: Text('This is a dummy screen for testing purposes.'),
      ),
    );
  }
}
