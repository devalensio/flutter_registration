import 'package:flutter/material.dart';

class CreatePasswordView extends StatelessWidget {
  final Function handleSubmit;

  CreatePasswordView(
    this.handleSubmit,
  );

  List<Map<String, Object>> get _complexityItems {
    return [
      {
        'title': 'a',
        'subTitle': 'Lowercase',
        'isPassed': false,
      },
      {
        'title': 'A',
        'subTitle': 'Uppercase',
        'isPassed': false,
      },
      {
        'title': '123',
        'subTitle': 'Number',
        'isPassed': false,
      },
      {
        'title': '9+',
        'subTitle': 'Characters',
        'isPassed': false,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Create Password',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Password will be used to login to account',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Create Password',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    // _togglevisibility();
                  },
                  child: Icon(
                    true ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blue,
                  ),
                ),
              ),
              onSubmitted: (_) {
                print('deva');
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Complexity', style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: _complexityItems
                .map(
                  (item) => Expanded(
                    child: Column(
                      children: [
                        Text(
                          item['title'],
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(item['subTitle']),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
                ),
                onPressed: handleSubmit,
                child: Text('Next'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
