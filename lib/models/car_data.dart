class CarDataModel {
  final String? date;
  final String? troubleCode;
  final String? description;
  final int? carYear;
  final int? enginePower;
  final int? engineCoolantTemp;
  final int? engineLoad;
  final int? engineRPM;
  final int? airfinal;
  final int? intakeTemp;
  final int? speed;
  final int? shortTermFuelBank1;
  final int? throttlePosition;
  final int? timingAdvance;

  CarDataModel(
      this.date,
      this.troubleCode,
      this.description,
      this.carYear,
      this.enginePower,
      this.engineCoolantTemp,
      this.engineLoad,
      this.engineRPM,
      this.airfinal,
      this.intakeTemp,
      this.speed,
      this.shortTermFuelBank1,
      this.throttlePosition,
      this.timingAdvance);
}
