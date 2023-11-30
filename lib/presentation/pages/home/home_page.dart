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
import '../../widget/load/load.dart';
import 'components/image_container.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(context),
      child: Consumer<HomeState>(
        builder: (_, state, __) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              // currentIndex: context.watch<MainState>().currentIndex,
              // onTap: context.read<MainState>().setIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.instagram),
                  label: 'Instagram',
                ),
              ],
            ),
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Column(
                      children: [
                        const TitleSubtitleLabel(
                          title: 'AstroPic',
                          subtitle: 'Astronomy Picture of the Day',
                        ),
                        const Divider(),
                        if (state.isLoadingAstronomyPictureDay) ...[
                          const Load(),
                        ] else if (state.astronomyPictureDayEntity != null) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  state.astronomyPictureDayEntity!.title,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                ImageContainer(
                                    imageLink:
                                        state.astronomyPictureDayEntity!.hdUrl),
                                const SizedBox(height: 10),
                                Text(
                                  state.astronomyPictureDayEntity!.explanation,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Column(
                      children: [
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
                          onPressed: state.fetchAstronomyPictureDay,
                          title: 'Pick',
                          showRadius: true,
                          loading: state.isLoadingAstronomyPictureDay,
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          onPressed: state.createContainerMedia,
                          title: 'Pubish',
                          showRadius: true,
                          loading: state.isLoadingCreateMediaContainer,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
