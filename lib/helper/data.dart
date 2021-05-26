import 'package:stay_updated/models/category_model.dart';

List<Categorymodel>getcatagories(){
  // ignore: deprecated_member_use
  List<Categorymodel> category=new List<Categorymodel>();
  Categorymodel categorymodel=new Categorymodel();

  categorymodel.categoryname="Business";
  categorymodel.imageurl="https://images.unsplash.com/photo-1611095973763-414019e72400?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80";
  category.add(categorymodel);
  categorymodel=new Categorymodel();

  categorymodel.categoryname="Entertainment";
  categorymodel.imageurl="https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZW50ZXJ0YWlubWVudHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);
  categorymodel=new Categorymodel();

  categorymodel.categoryname="General";
  categorymodel.imageurl="https://images.unsplash.com/photo-1499244571948-7ccddb3583f1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGdlbmVyYWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);
  categorymodel=new Categorymodel();

  categorymodel.categoryname="Sports";
  categorymodel.imageurl="https://images.unsplash.com/photo-1587280501635-68a0e82cd5ff?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c3BvcnRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);
  categorymodel=new Categorymodel();

  categorymodel.categoryname="Technology";
  categorymodel.imageurl="https://images.unsplash.com/photo-1496065187959-7f07b8353c55?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categorymodel);
  categorymodel=new Categorymodel();

  return category;
}