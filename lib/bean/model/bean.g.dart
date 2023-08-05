// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBeanCollection on Isar {
  IsarCollection<Bean> get beans => this.collection();
}

const BeanSchema = CollectionSchema(
  name: r'Bean',
  id: 4857764554495004333,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _beanEstimateSize,
  serialize: _beanSerialize,
  deserialize: _beanDeserialize,
  deserializeProp: _beanDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'roaster': LinkSchema(
      id: 2987581128859401298,
      name: r'roaster',
      target: r'Roaster',
      single: true,
    ),
    r'roast': LinkSchema(
      id: -136245177038150700,
      name: r'roast',
      target: r'Roast',
      single: true,
    ),
    r'flavors': LinkSchema(
      id: -6930841108744996653,
      name: r'flavors',
      target: r'Flavor',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _beanGetId,
  getLinks: _beanGetLinks,
  attach: _beanAttach,
  version: '3.1.0+1',
);

int _beanEstimateSize(
  Bean object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _beanSerialize(
  Bean object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

Bean _beanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Bean();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _beanDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _beanGetId(Bean object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _beanGetLinks(Bean object) {
  return [object.roaster, object.roast, object.flavors];
}

void _beanAttach(IsarCollection<dynamic> col, Id id, Bean object) {
  object.id = id;
  object.roaster.attach(col, col.isar.collection<Roaster>(), r'roaster', id);
  object.roast.attach(col, col.isar.collection<Roast>(), r'roast', id);
  object.flavors.attach(col, col.isar.collection<Flavor>(), r'flavors', id);
}

extension BeanQueryWhereSort on QueryBuilder<Bean, Bean, QWhere> {
  QueryBuilder<Bean, Bean, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BeanQueryWhere on QueryBuilder<Bean, Bean, QWhereClause> {
  QueryBuilder<Bean, Bean, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Bean, Bean, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Bean, Bean, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Bean, Bean, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Bean, Bean, QAfterWhereClause> idBetween(
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

extension BeanQueryFilter on QueryBuilder<Bean, Bean, QFilterCondition> {
  QueryBuilder<Bean, Bean, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Bean, Bean, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Bean, Bean, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension BeanQueryObject on QueryBuilder<Bean, Bean, QFilterCondition> {}

extension BeanQueryLinks on QueryBuilder<Bean, Bean, QFilterCondition> {
  QueryBuilder<Bean, Bean, QAfterFilterCondition> roaster(
      FilterQuery<Roaster> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'roaster');
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> roasterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'roaster', 0, true, 0, true);
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> roast(FilterQuery<Roast> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'roast');
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> roastIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'roast', 0, true, 0, true);
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> flavors(
      FilterQuery<Flavor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'flavors');
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> flavorsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'flavors', length, true, length, true);
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> flavorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'flavors', 0, true, 0, true);
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> flavorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'flavors', 0, false, 999999, true);
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> flavorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'flavors', 0, true, length, include);
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> flavorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'flavors', length, include, 999999, true);
    });
  }

  QueryBuilder<Bean, Bean, QAfterFilterCondition> flavorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'flavors', lower, includeLower, upper, includeUpper);
    });
  }
}

extension BeanQuerySortBy on QueryBuilder<Bean, Bean, QSortBy> {
  QueryBuilder<Bean, Bean, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Bean, Bean, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension BeanQuerySortThenBy on QueryBuilder<Bean, Bean, QSortThenBy> {
  QueryBuilder<Bean, Bean, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Bean, Bean, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Bean, Bean, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Bean, Bean, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension BeanQueryWhereDistinct on QueryBuilder<Bean, Bean, QDistinct> {
  QueryBuilder<Bean, Bean, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension BeanQueryProperty on QueryBuilder<Bean, Bean, QQueryProperty> {
  QueryBuilder<Bean, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Bean, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
