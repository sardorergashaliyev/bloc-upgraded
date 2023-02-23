import 'package:bloc_lesson/validate/validate_cubit.dart';
import 'package:bloc_lesson/validate/validate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({Key? key}) : super(key: key);

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

class _ValidatePageState extends State<ValidatePage> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validate Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocListener<ValidateCubit, ValidateState>(
            listenWhen: (previous, current) {
              return current.isTrue;
            },
            listener: (context, state) async {
              print('listener');
              if (state.text == _controller?.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Success'),
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    label: Text("Username"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<ValidateCubit, ValidateState>(
            builder: (context, state) {
              return state.isTrue
                  ? const SizedBox.shrink()
                  : const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Wrong answer',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ValidateCubit>().isTrue(_controller?.text ?? 'salom');
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
