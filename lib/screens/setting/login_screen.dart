import 'package:app/constants/layout_constants.dart';
import 'package:app/providers/notifiers/auth_notifier.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final _idController = TextEditingController();
  final _pwController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(actions: [],),
      body: Padding(
        padding: const EdgeInsets.only(bottom: LayoutConstants.containerPadding),
        child: Column(
          children: [
            ScreenHeader(
              title: 'Login',
              subTitle: 'with Family',
            ),
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Column(
                children: [
                  TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '아이디'
                    ),
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  SizedBox(height: 12,),
                  TextField(
                    controller: _pwController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호'
                    ),
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  SizedBox(height: 32,),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: !authState.isLoading ? () async {
                        final idValue = _idController.text;
                        final pwValue = _pwController.text;
                        if (idValue != '' && pwValue != '') {
                          if (await ref.read(authNotifierProvider.notifier).login(idValue, pwValue)) {
                            if (!context.mounted) return;
                            Navigator.pop(context);
                          } else {
                            if (!context.mounted) return;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('로그인 실패'),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Text('사용자 조회에 실패했습니다.'),
                                        Text('아이디와 비밀번호를 확인해주세요.'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('확인'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        }
                      } : null,
                      child: Text(!authState.isLoading ? '로그인' : '로그인중...'),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}