import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/views/cards/bloc/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StepperView extends StatefulWidget {
  final List<StepItem> listSteps;
  final List<Widget> stepContents;

  const StepperView({
    Key key,
    this.listSteps,
    @required this.stepContents,
  })  : assert(stepContents != null),
        super(key: key);

  @override
  _StepperViewState createState() => _StepperViewState();
}

class _StepperViewState extends State<StepperView> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<CardBloc>(context);
    final _controller = ScrollController();

    return Column(
      children: [
        Container(
          height: Adapt.px(170),
          child: StreamBuilder(
              stream: bloc,
              builder: (context, snapshot) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.listSteps.length,
                  padding: EdgeInsets.zero,
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    final step = widget.listSteps[index];
                    double indicatorSize = Adapt.px(50);
                    LineStyle beforeLineStyle = LineStyle(
                      color: Colors.green,
                    );
                    _DeliveryStatus status;
                    LineStyle afterLineStyle;
                    if (bloc.state.isLastStep) {
                      status = _DeliveryStatus.done;
                      indicatorSize = Adapt.px(50);
                    } else if (index == bloc.state.currentStep) {
                      status = _DeliveryStatus.doing;
                      indicatorSize = Adapt.px(50);
                    } else if (index > bloc.state.currentStep) {
                      status = _DeliveryStatus.todo;
                      indicatorSize = Adapt.px(50);
                      beforeLineStyle = LineStyle(
                        color: Color(0xFF747888),
                        thickness: Adapt.px(5),
                      );
                    } else {
                      status = _DeliveryStatus.done;
                      indicatorSize = Adapt.px(50);
                    }

                    return TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.manual,
                      lineXY: 0.4,
                      isFirst: index == 0,
                      isLast: index == widget.listSteps.length - 1,
                      beforeLineStyle: beforeLineStyle,
                      afterLineStyle: afterLineStyle,
                      indicatorStyle: IndicatorStyle(
                        width: indicatorSize,
                        height: indicatorSize,
                        indicator: _IndicatorDelivery(
                          status: status,
                          icon: step.icon,
                        ),
                      ),
                      endChild: _EndChildDelivery(
                        text: step.title,
                        current: index == bloc.state.currentStep,
                      ),
                    );
                  },
                );
              }),
        ),
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: bloc.pageController,
            onPageChanged: (int i) {},
            children: widget.stepContents.map<Widget>((e) {
              return _StepperContent(
                scroll: _controller,
                content: e,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  List<Widget> joinWidgets(List<Widget> widgets, Widget widget) {
    List<Widget> childs = [widget];
    widgets.forEach((e) => childs.add(e));
    return childs;
  }
}

enum _DeliveryStatus { done, doing, todo }

class StepItem {
  String title;
  IconData icon;
  StepItem({
    this.title,
    this.icon,
  });
}

class _StepperContent extends StatelessWidget {
  final Widget content;
  final ScrollController scroll;

  const _StepperContent({
    Key key,
    @required this.content,
    @required this.scroll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<CardBloc>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          content,
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Row(
              children: <Widget>[
                bloc.state.currentStep > 0 && !bloc.state.isLastStep
                    ? FlatButton(
                        color: AppTheme.kPrimaryColor,
                        onPressed: () {
                          back(3);
                          bloc.back();
                        },
                        child: Text(
                          "Regresar",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : SizedBox.shrink(),
                bloc.state.currentStep > 0
                    ? SizedBox(
                        width: 10,
                      )
                    : SizedBox.shrink(),
                FlatButton(
                  color: AppTheme.kPrimaryColor,
                  onPressed: () {
                    //previus(3);
                    bloc.submit();
                  },
                  child: Text(
                    bloc.state.currentStep > 0 && bloc.state.isLastStep ? "Terminar" : "Siguiente",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  previus(i) => scroll.animateTo(
        20.0 * i,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
  back(i) => scroll.animateTo(
        20.0 / i,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
}

class _EndChildDelivery extends StatelessWidget {
  const _EndChildDelivery({
    Key key,
    @required this.text,
    @required this.current,
  }) : super(key: key);

  final String text;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 110),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 110),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sniglet(
                    fontSize: Adapt.px(25),
                    color: current ? const Color(0xFF2ACA8E) : Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IndicatorDelivery extends StatelessWidget {
  final _DeliveryStatus status;
  final IconData icon;

  const _IndicatorDelivery({
    Key key,
    this.status,
    this.icon = Icons.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case _DeliveryStatus.done:
        return CircleAvatar(
          backgroundColor: Color(0xFF2ACA8E),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: Adapt.px(30),
          ),
        );
      case _DeliveryStatus.doing:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2ACA8E),
          ),
          child: Center(
            child: SizedBox(
              height: Adapt.px(30),
              width: Adapt.px(30),
              child: CircularProgressIndicator(
                strokeWidth: Adapt.px(3),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        );
      case _DeliveryStatus.todo:
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: Adapt.px(30),
            ),
          ),
        );
    }
    return Container();
  }
}
