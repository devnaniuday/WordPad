import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wordpad/colors.dart';

class DocumentScreen extends ConsumerStatefulWidget {
  final String id;
  const DocumentScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends ConsumerState<DocumentScreen> {
  TextEditingController titleConroller =
      TextEditingController(text: 'Untitled Document');
  QuillController _controller = QuillController.basic();

  @override
  void dispos() {
    super.dispose();
    titleConroller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.lock, size: 16),
              label: const Text('Share'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kBlueColor,
              ),
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9.0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/docs-logo.png',
                height: 40,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 180,
                child: TextField(
                  controller: titleConroller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kBlueColor,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kGreyColor,
                width: 0.1,
              ),
            ),
          ),
        ),
      ),
      body: QuillProvider(
        configurations: QuillConfigurations(controller: _controller),
        child: Column(
          children: [
            QuillToolbar.basic(),
            Expanded(
              child: Container(
                child: QuillEditor.basic(
                  readOnly: false, // true for view only mode
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
