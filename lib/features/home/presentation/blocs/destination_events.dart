abstract class DestinationEvents {}

class GetDestinationsByMediaCategory extends DestinationEvents {
  final String mediaCategory;
  GetDestinationsByMediaCategory({required this.mediaCategory});

}