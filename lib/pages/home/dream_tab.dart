import 'package:flutter/material.dart';
import 'package:zoomscroller/pages/prompt_edit_page.dart';

class DreamTab extends StatefulWidget {
  @override
  State<DreamTab> createState() => _DreamTabState();
}

class _DreamTabState extends State<DreamTab> {
  String _prompt = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16),
          _promptWidget(),
          ElevatedButton(
            onPressed: _attemptToGenerate,
            child: Text("Generate"),
          ),
        ],
      ),
    );
  }

  Widget _promptWidget() {
    String promptToShow = _prompt.trim();
    if (promptToShow.isEmpty) {
      promptToShow = "Tap here to describe what we're painting today.";
    }

    return GestureDetector(
      onTap: () async {
        final newPrompt = await Navigator.of(context).push<String>(
          MaterialPageRoute(
            builder: (_) => PromptEditPage(initialText: _prompt),
          ),
        );
        if (newPrompt == null) return;
        setState(() {
          _prompt = newPrompt;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                promptToShow,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _prompt.isEmpty ? 16 : 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _attemptToGenerate() async {

  }
}