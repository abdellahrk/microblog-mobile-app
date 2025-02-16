import 'package:flutter/material.dart';
import 'package:image_field/image_field.dart';

class NewBlogPost extends StatefulWidget {
  const NewBlogPost({super.key});

  @override
  State<NewBlogPost> createState() => _NewBlogPostState();
}

class _NewBlogPostState extends State<NewBlogPost> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("New Blog Post"),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _titleController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _contentController,
                          maxLines: 6,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ImageField(
                          texts: const {
                            'fieldFormText': 'Upload to server',
                            'titleText': 'Upload to server'
                          },
                          remoteImage: true,
                          onUpload: (pickedFile,
                              controllerLinearProgressIndicator) async {
                            // dynamic fileUploaded = await uploadToServer(
                            //   pickedFile,
                            //   uploadProgress: (percent) {
                            //     var uploadProgressPercentage = percent / 100;
                            //     controllerLinearProgressIndicator!
                            //         .updateProgress(uploadProgressPercentage);
                            //   },
                            // );
                            return fileUploaded;
                          },
                        ),
                        ElevatedButton(onPressed: () {}, child: Text("Submit"))
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
