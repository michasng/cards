import 'package:cards/models/template.dart';
import 'package:cards/services/model_service.dart';

class TemplateService extends ModelService<Template> {
  TemplateService()
      : super(collectionName: 'templates', fromJson: Template.fromJson);
}
