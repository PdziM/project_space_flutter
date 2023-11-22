import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../main_state.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/buttons/custom_button.dart';
import '../../widget/buttons/custom_icon_button.dart';
import '../../widget/inputs/custom_text_field.dart';
import '../../widget/label/title_subtitle_label.dart';
import 'home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ChangeNotifierProvider(
      create: (_) => HomeState(context),
      child: Consumer<HomeState>(
        builder: (_, state, __) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'AstroPic',
              actions: [
                CustomIconButton(
                  iconData: context.watch<MainState>().darkTheme
                      ? FontAwesomeIcons.moon
                      : FontAwesomeIcons.sun,
                  iconColor: AppColors.bg100,
                  onTap: context.read<MainState>().setTheme,
                )
              ],
            ),
            body: SizedBox(
              height: size.height,
              width: size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [
                    const TitleSubtitleLabel(
                      title: 'AstroPic',
                      subtitle: 'Astronomy Picture of the Day',
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    if (state.astronomyPictureDayEntity != null) ...[
                      Image.network(state.astronomyPictureDayEntity!.hdUrl),
                    ] else ...[
                      Container(),
                    ],
                    CustomTextField(
                      title: 'Pick date',
                      hintText: 'Pick date',
                      prefixIcon: const Icon(FontAwesomeIcons.calendar),
                      controller: state.dateController,
                      readOnly: true,
                      onTap: state.datePicker,
                      onChanged: state.setDate,
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      onPressed: state.getAstronomyPictureDay,
                      title: 'Pick',
                      showRadius: true,
                      loading: state.isLoading,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
