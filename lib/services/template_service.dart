import 'package:cards/models/template.dart';
import 'package:cards/services/service.dart';

class TemplateService extends Service<Template> {
  TemplateService()
      : super(
          collectionName: 'templates',
          fromJson: Template.fromJson,
        );

  Future<TemplateService> seeded() async {
    await seed();
    return this;
  }
}
