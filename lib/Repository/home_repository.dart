import 'package:flutter/material.dart';

import '../provider/home_provider.dart';
import 'base_repository.dart';


class HomeRepository extends BaseRepository{
  final HomeProvider _provider;

  HomeRepository(this._provider);

  Future allRecipeCall({request}) async {
    debugPrint("Request ******>$request");
    return await processResult(await _provider.allRecipe(request));
  }

  Future registerCall({request}) async {
    debugPrint("Request ******>$request");
    return await processResult(await _provider.register(request));
  }

  // Future addApplyJobCall({request}) async {
  //   debugPrint("Request ******>$request");
  //   return await processResult(await _provider.addApplyJob(request));
  // }

  //  Future deletedJobCall({request}) async {
  //   debugPrint("Request ******>$request");
  //   return await processResult(await _provider.deletedJob(request));
  // }

  // Future getMyJobsCall({request}) async {
  //   debugPrint("Request ******>$request");
  //   return await processResult(await _provider.getMyJobs(request));
  // }
}