import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:microblog_app/model/blog/blog.dart';
import 'package:microblog_app/service/api_service.dart';

class NewBlogPost extends StatefulWidget {
  const NewBlogPost({super.key});

  @override
  State<NewBlogPost> createState() => _NewBlogPostState();
}

class _NewBlogPostState extends State<NewBlogPost> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FilePickerResult? result;
  File? file;

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
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              file != null
                                  ? Image.file(file!,
                                      height: 150, width: 150, fit: BoxFit.fill)
                                  : Container()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              result = await FilePicker.platform
                                  .pickFiles(type: FileType.image);
                              file = File(result!.files.single.path!);
                              setState(() {});
                            },
                            child: Text("Upload Image")),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              final blog = Blog(
                                  title: _titleController.text.toString(),
                                  content: _contentController.text.toString(),
                                  image: result!.files[0].path!,
                                  imagePath: result!.files[0].name);
                              final apiService = ApiService();
                              var response = await apiService.addBlog(blog);
                              if (response.statusCode == 201 ||
                                  response.statusCode == 200) {
                                var slug = jsonDecode(response.body)["slug"];
                                context.pushReplacement('/blog/$slug');
                              }
                            },
                            child: Text("Submit"))
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
