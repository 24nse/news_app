
import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';
class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try{
      var response=await dio.get(
                  'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737&category=$category'
      );
      Map<String,dynamic>jsonData=response.data;
      List<dynamic> articles=jsonData["articles"];
      List<ArticleModel> articleList=[];
      for(var article in articles){
        ArticleModel articleModel =ArticleModel(
          image: article["urlToImage"], 
          title: article['title'], 
          subTitle: article["description"]
          );
          articleList.add(articleModel);
      }
      return articleList;
    }catch(e){
      return [];
    }
  }
}