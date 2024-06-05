class HomeModel {
  String? imageBack ;
  String? image;

  HomeModel(this.imageBack, this.image);
}

List <HomeModel> homeModel = [
  HomeModel('assets/images/imageBack1.png', 'assets/images/list1.png'),
  HomeModel('assets/images/imageBack2.png', 'assets/images/list2.png'),
  HomeModel('assets/images/imageBack3.png', 'assets/images/list3.png'),
  HomeModel('assets/images/imageBack4.png', 'assets/images/list4.png'),
  HomeModel('assets/images/imageBack1.png', 'assets/images/list1.png'),
  HomeModel('assets/images/imageBack1.png', 'assets/images/list2.png'),
];

class NurseModel {
  String? image ;
  String? name;

  NurseModel(this.image,this.name);
}

List <NurseModel> nurseModel = [
  NurseModel('assets/images/nurses1.png','Dr. Crick'),
  NurseModel('assets/images/nurses2.png','Dr. Strain'),
  NurseModel('assets/images/nurses3.png','Dr. Lachinet'),
  NurseModel('assets/images/nurses1.png','Dr. Strain'),
];