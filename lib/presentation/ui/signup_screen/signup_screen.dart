import 'package:aak_signup/presentation/core_widgets/text_field_widget.dart';
import 'package:aak_signup/presentation/ui/signup_screen/signup_bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../utils/app_colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  void test() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/icons/app_icon.webp',
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Join Us!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                'To begin this journey, tell us what type of account you\'d be opening.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor.withValues(alpha: 0.7),
                ),
              ),
              BlocProvider(
                create: (context) => GetIt.I.get<SignupBloc>(),
                child: const SingUpBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingUpBodyWidget extends StatelessWidget {
  const SingUpBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (BuildContext context, SignupState state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                context,
                'First Name',
                (value) => context.read<SignupBloc>().add(SignupFirstNameChanged(value)),
              ),
              _buildTextField(
                context,
                'Last Name',
                (value) => context.read<SignupBloc>().add(SignupLastNameChanged(value)),
              ),
              _buildTextField(
                context,
                'Username',
                (value) => context.read<SignupBloc>().add(SignupUsernameChanged(value)),
              ),
              _buildTextField(
                context,
                'Email',
                (value) => context.read<SignupBloc>().add(SignupEmailChanged(value)),
              ),
              _buildTextField(
                context,
                'Country',
                (value) => context.read<SignupBloc>().add(SignupCountryChanged(value)),
              ),
              _buildTextField(
                context,
                'Password',
                (value) => context.read<SignupBloc>().add(SignupPasswordChanged(value)),
                obscureText: true,
              ),
              _buildTextField(
                context,
                'Confirm Password',
                (value) => context.read<SignupBloc>().add(SignupConfirmPasswordChanged(value)),
                obscureText: true,
              ),
              Wrap(
                children: [
                  UserTypeWidget(
                    label: 'Researcher',
                    isSelected: state.userType == 'researcher',
                    onTap: () {
                      context.read<SignupBloc>().add(SignupUserTypeChanged('researcher'));
                    },
                  ),
                  UserTypeWidget(
                    label: 'Institution',
                    isSelected: state.userType == 'institution_staff',
                    onTap: () {
                      context.read<SignupBloc>().add(SignupUserTypeChanged('institution_staff'));
                    },
                  ),
                  UserTypeWidget(
                    label: 'Service Provider',
                    isSelected: state.userType == 'service_provider',
                    onTap: () {
                      context.read<SignupBloc>().add(SignupUserTypeChanged('service_provider'));
                    },
                  ),
                  UserTypeWidget(
                    label: 'Venture Capitalist / Accredited Investor',
                    isSelected: state.userType == 'investor',
                    onTap: () {
                      context.read<SignupBloc>().add(SignupUserTypeChanged('investor'));
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  context.read<SignupBloc>().add(SignupSubmitted());
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith((state) => AppColors.primaryColor),
                  padding: WidgetStateProperty.resolveWith((state) => EdgeInsets.all(8.r)),
                ),
                child: state.isSubmitting
                    ? Center(
                        child: SizedBox(
                          height: 16.h,
                          width: 18.w,
                          child: CircularProgressIndicator(
                            color: AppColors.whiteColor,
                            strokeWidth: 3.w,
                          ),
                        ),
                      )
                    : Text(
                        'Submit',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 15.sp,
                        ),
                      ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(BuildContext context, String label, Function(String) onChanged, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFieldWidget(
        onChange: onChanged,
        hintText: label,
      ),
    );
  }
}

class UserTypeWidget extends StatelessWidget {
  final bool isSelected;
  final String label;
  final GestureTapCallback onTap;

  const UserTypeWidget({super.key, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
          color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.whiteColor : AppColors.primaryColor,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
