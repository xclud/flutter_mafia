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

const _lecter = MafiaRole(
  'دکتر لکتر',
  'مقتول تک تیر انداز را نجات می دهد.',
  'DR_LECTER',
  true,
);

const _beloved = MafiaRole(
  'معشوقه',
  'اگر در روز کشته شود، مافیا در شب دو نفر را می کشد.',
  'BELOVED',
  true,
);

const _traitor = MafiaRole(
  'خائن',
  'مافیا است، شب با مافیا بیدار نمی شود.',
  'TRAITOR',
  true,
);

const _godFather = MafiaRole(
  'رییس مافیا',
  'حرف آخر را می زند.',
  'GODFATHER',
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
  'تک تیرانداز (حرفه ای)',
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

const cityRoles = [
  _detective,
  _doctor,
  _vigilante,
  _witness,
  _undercoverCop,
  _miller,
  _dentist,
  _lawyer,
];

const evilRoles = [
  _godFather,
  _lecter,
  _beloved,
  _traitor,
];

const mafiaRoles = [
  ...cityRoles,
  ...evilRoles,
];
