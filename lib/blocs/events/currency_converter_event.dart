
abstract class CCEvent{}


class LoadCCEvent
    extends CCEvent{}


class NewValueCCEvent
    extends CCEvent{
  double newValue;

  NewValueCCEvent({
    required this.newValue});
}
