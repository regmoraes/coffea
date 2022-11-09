// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRecipeCollection on Isar {
  IsarCollection<Recipe> get recipes => this.collection();
}

const RecipeSchema = CollectionSchema(
  name: r'Recipe',
  id: 8054415271972849591,
  properties: {
    r'beanQuantity': PropertySchema(
      id: 0,
      name: r'beanQuantity',
      type: IsarType.double,
    ),
    r'comments': PropertySchema(
      id: 1,
      name: r'comments',
      type: IsarType.string,
    ),
    r'grindSize': PropertySchema(
      id: 2,
      name: r'grindSize',
      type: IsarType.object,
      target: r'GrindSize',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'ratio': PropertySchema(
      id: 4,
      name: r'ratio',
      type: IsarType.double,
    ),
    r'steps': PropertySchema(
      id: 5,
      name: r'steps',
      type: IsarType.objectList,
      target: r'Step',
    ),
    r'waterQuantity': PropertySchema(
      id: 6,
      name: r'waterQuantity',
      type: IsarType.double,
    )
  },
  estimateSize: _recipeEstimateSize,
  serialize: _recipeSerialize,
  deserialize: _recipeDeserialize,
  deserializeProp: _recipeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'method': LinkSchema(
      id: -3537441982269264622,
      name: r'method',
      target: r'Method',
      single: true,
    ),
    r'bean': LinkSchema(
      id: 8399506678366956711,
      name: r'bean',
      target: r'Bean',
      single: true,
    )
  },
  embeddedSchemas: {r'GrindSize': GrindSizeSchema, r'Step': StepSchema},
  getId: _recipeGetId,
  getLinks: _recipeGetLinks,
  attach: _recipeAttach,
  version: '3.0.2',
);

int _recipeEstimateSize(
  Recipe object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.comments;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 +
      GrindSizeSchema.estimateSize(
          object.grindSize, allOffsets[GrindSize]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.steps.length * 3;
  {
    final offsets = allOffsets[Step]!;
    for (var i = 0; i < object.steps.length; i++) {
      final value = object.steps[i];
      bytesCount += StepSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _recipeSerialize(
  Recipe object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.beanQuantity);
  writer.writeString(offsets[1], object.comments);
  writer.writeObject<GrindSize>(
    offsets[2],
    allOffsets,
    GrindSizeSchema.serialize,
    object.grindSize,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeDouble(offsets[4], object.ratio);
  writer.writeObjectList<Step>(
    offsets[5],
    allOffsets,
    StepSchema.serialize,
    object.steps,
  );
  writer.writeDouble(offsets[6], object.waterQuantity);
}

Recipe _recipeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Recipe();
  object.beanQuantity = reader.readDouble(offsets[0]);
  object.comments = reader.readStringOrNull(offsets[1]);
  object.grindSize = reader.readObjectOrNull<GrindSize>(
        offsets[2],
        GrindSizeSchema.deserialize,
        allOffsets,
      ) ??
      GrindSize();
  object.id = id;
  object.name = reader.readString(offsets[3]);
  object.ratio = reader.readDouble(offsets[4]);
  object.waterQuantity = reader.readDouble(offsets[6]);
  return object;
}

P _recipeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<GrindSize>(
            offset,
            GrindSizeSchema.deserialize,
            allOffsets,
          ) ??
          GrindSize()) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readObjectList<Step>(
            offset,
            StepSchema.deserialize,
            allOffsets,
            Step(),
          ) ??
          []) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recipeGetId(Recipe object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recipeGetLinks(Recipe object) {
  return [object.method, object.bean];
}

void _recipeAttach(IsarCollection<dynamic> col, Id id, Recipe object) {
  object.id = id;
  object.method.attach(col, col.isar.collection<Method>(), r'method', id);
  object.bean.attach(col, col.isar.collection<Bean>(), r'bean', id);
}

extension RecipeQueryWhereSort on QueryBuilder<Recipe, Recipe, QWhere> {
  QueryBuilder<Recipe, Recipe, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecipeQueryWhere on QueryBuilder<Recipe, Recipe, QWhereClause> {
  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecipeQueryFilter on QueryBuilder<Recipe, Recipe, QFilterCondition> {
  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> beanQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beanQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> beanQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beanQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> beanQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beanQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> beanQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beanQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comments',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comments',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comments',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> commentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> ratioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ratio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> ratioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ratio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> ratioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ratio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> ratioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ratio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> stepsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> stepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> stepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> stepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> stepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> stepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> waterQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> waterQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> waterQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> waterQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension RecipeQueryObject on QueryBuilder<Recipe, Recipe, QFilterCondition> {
  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> grindSize(
      FilterQuery<GrindSize> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'grindSize');
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> stepsElement(
      FilterQuery<Step> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'steps');
    });
  }
}

extension RecipeQueryLinks on QueryBuilder<Recipe, Recipe, QFilterCondition> {
  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> method(
      FilterQuery<Method> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'method');
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> methodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'method', 0, true, 0, true);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> bean(
      FilterQuery<Bean> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'bean');
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> beanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'bean', 0, true, 0, true);
    });
  }
}

extension RecipeQuerySortBy on QueryBuilder<Recipe, Recipe, QSortBy> {
  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByBeanQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beanQuantity', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByBeanQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beanQuantity', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratio', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratio', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByWaterQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterQuantity', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByWaterQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterQuantity', Sort.desc);
    });
  }
}

extension RecipeQuerySortThenBy on QueryBuilder<Recipe, Recipe, QSortThenBy> {
  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByBeanQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beanQuantity', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByBeanQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beanQuantity', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratio', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratio', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByWaterQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterQuantity', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByWaterQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterQuantity', Sort.desc);
    });
  }
}

extension RecipeQueryWhereDistinct on QueryBuilder<Recipe, Recipe, QDistinct> {
  QueryBuilder<Recipe, Recipe, QDistinct> distinctByBeanQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beanQuantity');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByComments(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comments', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ratio');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByWaterQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterQuantity');
    });
  }
}

extension RecipeQueryProperty on QueryBuilder<Recipe, Recipe, QQueryProperty> {
  QueryBuilder<Recipe, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> beanQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beanQuantity');
    });
  }

  QueryBuilder<Recipe, String?, QQueryOperations> commentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comments');
    });
  }

  QueryBuilder<Recipe, GrindSize, QQueryOperations> grindSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grindSize');
    });
  }

  QueryBuilder<Recipe, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> ratioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ratio');
    });
  }

  QueryBuilder<Recipe, List<Step>, QQueryOperations> stepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'steps');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> waterQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterQuantity');
    });
  }
}
