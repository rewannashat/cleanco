class HomeModel {
  String? text ;
  String? image;

  HomeModel(this.text, this.image);
}

List <HomeModel> homeModel = [
  HomeModel('Cleaning', 'assets/images/list1.png'),
  HomeModel('Maid', 'assets/images/list2.png'),
  HomeModel('Nurse', 'assets/images/list3.png'),
  HomeModel('Laundry', 'assets/images/list4.png'),
  HomeModel('Man Salon', 'assets/images/list5.png'),
  HomeModel('Car Wash', 'assets/images/list6.png'),
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