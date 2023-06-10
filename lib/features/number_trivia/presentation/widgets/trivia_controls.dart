import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_trivia_bloc.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    super.key,
  });

  @override
  State<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  late String inputStr;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: 'Input a number',
            ),
            onChanged: (value) => inputStr = value,
            onSaved: (value) => inputStr = value!,
            onFieldSubmitted: (_) => addConcrete(),
            validator: (value) => value!.isEmpty ? 'Input a number' : null,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).hintColor,
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: addConcrete,
                  child: const Text(
                    'Search',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Get random trivia',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addConcrete() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _controller.clear();
      BlocProvider.of<NumberTriviaBloc>(context).add(
        GetTriviaForConcreteNumber(inputStr),
      );
    }
  }
}
