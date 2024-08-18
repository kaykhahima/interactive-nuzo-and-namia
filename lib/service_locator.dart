import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';
import 'package:interactive_nuzo_and_namia/utils/constants.dart';

import 'core/network/network_info.dart';
import 'features/game/model/game_model.dart';

//get instance of get_it
final sl = GetIt.instance;

///Initialize dependencies
void initializeDependencies() {
  //get instance of appwrite (backend) client
  final client = Client()
      .setEndpoint(AppConstants.endpoint)
      .setProject(AppConstants.projectId);

  //get instance of appwrite database
  final database = Databases(client);

  //get instance of NetworkInfo
  final networkInfo = NetworkInfoImpl();

  //register instance game model
  sl.registerLazySingleton<GameModel>(
    () => GameModel(
      client: client,
      database: database,
      networkInfo: networkInfo,
    ),
  );
}
