class MafiaRole {
  final String name;
  final String description;
  final String tag;
  final bool evil;

  const MafiaRole(this.name, this.description, this.tag, [this.evil = false]);
}

const _doctor = MafiaRole(
  'دکتر',
  'مقتول شب را نجات می دهد.',
  'DOCTOR',
);

const _undercoverCop = MafiaRole(
  'پلیس مخفی',
  'شهروند است، شب با مافیا بیدار می شود.',
  'UNDERCOVER_COP',
);

const _traitor = MafiaRole(
  'خائن',
  'مافیا است، شب با مافیا بیدار نمی شود.',
  'TRAITOR',
  true,
);
const _beloved = MafiaRole(
  'معشوقه',
  'معشوقه رییس مافیا.',
  'BELOVED',
  true,
);

const _lawyer = MafiaRole(
  'وکیل',
  'موکلش در رای گیری روز بعد نمی میرد.',
  'LAWYER',
);

const _miller = MafiaRole(
  'آسیابان',
  'شهروند است اما همیشه در مظن اتهام.',
  'MILLER',
);

const _detective = MafiaRole(
  'کاراگاه',
  'مافیا را پیدا می کند.',
  'DETECTIVE',
);

const _vigilante = MafiaRole(
  'تک تیرانداز',
  'هر شب یک نفر را می کشد.',
  'VIGILANTE',
);

const _witness = MafiaRole(
  'دختر بچه',
  'همه مافیا ها را می شناسد.',
  'WITNESS',
);

const _dentist = MafiaRole(
  'دندان پزشک',
  'شب ها یک نفر را ساکت می کند.',
  'DENTIST',
);

const mafiaRoles = [
  _detective,
  _doctor,
  _witness,
  _undercoverCop,
  _miller,
  _dentist,
  _lawyer,
  _vigilante,
  _beloved,
  _traitor,
];
