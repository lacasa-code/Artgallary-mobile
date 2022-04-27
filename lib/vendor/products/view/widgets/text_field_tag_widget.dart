import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../../../utils/helper/media_query.dart';

class TextFieldTag extends StatefulWidget {
  const TextFieldTag({Key key}) : super(key: key);

  @override
  State<TextFieldTag> createState() => _TextFieldTagState();
}

class _TextFieldTagState extends State<TextFieldTag> {
  double _distanceToField;
  TextfieldTagsController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldTags(
      textfieldTagsController: _controller,
      textSeparators: const [' ', ','],
      letterCase: LetterCase.normal,
      validator: (String tag) {
        if (tag == 'php') {
          return 'No, please just no';
        } else if (_controller.getTags.contains(tag)) {
          return 'you already entered that';
        }
        return null;
      },
      inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
        return ((context, sc, tags, onTagDelete) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextField(
              controller: tec,
              focusNode: fn,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                    vertical: context.height * (0.022),
                    horizontal: context.width * 0.02),

                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffa3a3a3)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffa3a3a3)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffa3a3a3)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                helperText: '',
                // helperStyle: const TextStyle(
                //   color: Color.fromARGB(255, 74, 137, 92),
                // ),
                hintText: _controller.hasTags ? '' : "Enter tag...",
                errorText: error,
                prefixIconConstraints:
                    BoxConstraints(maxWidth: _distanceToField * 0.74),
                prefixIcon: tags.isNotEmpty
                    ? SingleChildScrollView(
                        controller: sc,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: tags.map((String tag) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    '$tag',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    print("$tag selected");
                                  },
                                ),
                                const SizedBox(width: 4.0),
                                InkWell(
                                  child: const Icon(
                                    Icons.cancel,
                                    size: 14.0,
                                    color: Color.fromARGB(255, 233, 233, 233),
                                  ),
                                  onTap: () {
                                    onTagDelete(tag);
                                  },
                                )
                              ],
                            ),
                          );
                        }).toList()),
                      )
                    : null,
              ),
              onChanged: onChanged,
              onSubmitted: onSubmitted,
            ),
          );
        });
      },
    );
  }
}
