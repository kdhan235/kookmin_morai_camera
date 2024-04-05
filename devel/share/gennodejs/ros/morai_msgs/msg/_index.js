
"use strict";

let ObjectStatus = require('./ObjectStatus.js');
let ObjectStatusList = require('./ObjectStatusList.js');
let TrafficLight = require('./TrafficLight.js');
let SyncModeSetGear = require('./SyncModeSetGear.js');
let MultiPlayEventResponse = require('./MultiPlayEventResponse.js');
let FaultInjection_Tire = require('./FaultInjection_Tire.js');
let IntersectionStatus = require('./IntersectionStatus.js');
let ERP42Info = require('./ERP42Info.js');
let SkidSteer6wUGVStatus = require('./SkidSteer6wUGVStatus.js');
let FaultInjection_Response = require('./FaultInjection_Response.js');
let GetTrafficLightStatus = require('./GetTrafficLightStatus.js');
let SyncModeRemoveObject = require('./SyncModeRemoveObject.js');
let ObjectStatusListExtended = require('./ObjectStatusListExtended.js');
let VehicleSpecIndex = require('./VehicleSpecIndex.js');
let SyncModeCtrlCmd = require('./SyncModeCtrlCmd.js');
let PREvent = require('./PREvent.js');
let FaultStatusInfo_Vehicle = require('./FaultStatusInfo_Vehicle.js');
let ScenarioLoad = require('./ScenarioLoad.js');
let SVADC = require('./SVADC.js');
let WaitForTick = require('./WaitForTick.js');
let PRStatus = require('./PRStatus.js');
let EgoVehicleStatusExtended = require('./EgoVehicleStatusExtended.js');
let MoraiSimProcHandle = require('./MoraiSimProcHandle.js');
let MoraiTLIndex = require('./MoraiTLIndex.js');
let RadarDetections = require('./RadarDetections.js');
let FaultInjection_Controller = require('./FaultInjection_Controller.js');
let SkidSteer6wUGVCtrlCmd = require('./SkidSteer6wUGVCtrlCmd.js');
let Lamps = require('./Lamps.js');
let EgoVehicleStatus = require('./EgoVehicleStatus.js');
let FaultStatusInfo_Sensor = require('./FaultStatusInfo_Sensor.js');
let FaultInjection_Sensor = require('./FaultInjection_Sensor.js');
let SyncModeAddObject = require('./SyncModeAddObject.js');
let EgoDdVehicleStatus = require('./EgoDdVehicleStatus.js');
let SkateboardCtrlCmd = require('./SkateboardCtrlCmd.js');
let WoowaDillyStatus = require('./WoowaDillyStatus.js');
let SyncModeScenarioLoad = require('./SyncModeScenarioLoad.js');
let CtrlCmd = require('./CtrlCmd.js');
let IntscnTL = require('./IntscnTL.js');
let CollisionData = require('./CollisionData.js');
let SyncModeInfo = require('./SyncModeInfo.js');
let GhostMessage = require('./GhostMessage.js');
let MapSpec = require('./MapSpec.js');
let VehicleSpec = require('./VehicleSpec.js');
let RadarDetection = require('./RadarDetection.js');
let DillyCmdResponse = require('./DillyCmdResponse.js');
let MapSpecIndex = require('./MapSpecIndex.js');
let NpcGhostInfo = require('./NpcGhostInfo.js');
let EventInfo = require('./EventInfo.js');
let MoraiTLInfo = require('./MoraiTLInfo.js');
let SaveSensorData = require('./SaveSensorData.js');
let FaultStatusInfo_Overall = require('./FaultStatusInfo_Overall.js');
let MultiEgoSetting = require('./MultiEgoSetting.js');
let FaultStatusInfo = require('./FaultStatusInfo.js');
let SkateboardStatus = require('./SkateboardStatus.js');
let MultiPlayEventRequest = require('./MultiPlayEventRequest.js');
let MoraiSrvResponse = require('./MoraiSrvResponse.js');
let SyncModeCmdResponse = require('./SyncModeCmdResponse.js');
let MoraiSimProcStatus = require('./MoraiSimProcStatus.js');
let SensorPosControl = require('./SensorPosControl.js');
let WaitForTickResponse = require('./WaitForTickResponse.js');
let PRCtrlCmd = require('./PRCtrlCmd.js');
let IntersectionControl = require('./IntersectionControl.js');
let GPSMessage = require('./GPSMessage.js');
let SetTrafficLight = require('./SetTrafficLight.js');
let DillyCmd = require('./DillyCmd.js');
let SyncModeCmd = require('./SyncModeCmd.js');
let SyncModeResultResponse = require('./SyncModeResultResponse.js');
let NpcGhostCmd = require('./NpcGhostCmd.js');
let ObjectStatusExtended = require('./ObjectStatusExtended.js');
let VehicleCollisionData = require('./VehicleCollisionData.js');
let DdCtrlCmd = require('./DdCtrlCmd.js');
let VehicleCollision = require('./VehicleCollision.js');
let ReplayInfo = require('./ReplayInfo.js');

module.exports = {
  ObjectStatus: ObjectStatus,
  ObjectStatusList: ObjectStatusList,
  TrafficLight: TrafficLight,
  SyncModeSetGear: SyncModeSetGear,
  MultiPlayEventResponse: MultiPlayEventResponse,
  FaultInjection_Tire: FaultInjection_Tire,
  IntersectionStatus: IntersectionStatus,
  ERP42Info: ERP42Info,
  SkidSteer6wUGVStatus: SkidSteer6wUGVStatus,
  FaultInjection_Response: FaultInjection_Response,
  GetTrafficLightStatus: GetTrafficLightStatus,
  SyncModeRemoveObject: SyncModeRemoveObject,
  ObjectStatusListExtended: ObjectStatusListExtended,
  VehicleSpecIndex: VehicleSpecIndex,
  SyncModeCtrlCmd: SyncModeCtrlCmd,
  PREvent: PREvent,
  FaultStatusInfo_Vehicle: FaultStatusInfo_Vehicle,
  ScenarioLoad: ScenarioLoad,
  SVADC: SVADC,
  WaitForTick: WaitForTick,
  PRStatus: PRStatus,
  EgoVehicleStatusExtended: EgoVehicleStatusExtended,
  MoraiSimProcHandle: MoraiSimProcHandle,
  MoraiTLIndex: MoraiTLIndex,
  RadarDetections: RadarDetections,
  FaultInjection_Controller: FaultInjection_Controller,
  SkidSteer6wUGVCtrlCmd: SkidSteer6wUGVCtrlCmd,
  Lamps: Lamps,
  EgoVehicleStatus: EgoVehicleStatus,
  FaultStatusInfo_Sensor: FaultStatusInfo_Sensor,
  FaultInjection_Sensor: FaultInjection_Sensor,
  SyncModeAddObject: SyncModeAddObject,
  EgoDdVehicleStatus: EgoDdVehicleStatus,
  SkateboardCtrlCmd: SkateboardCtrlCmd,
  WoowaDillyStatus: WoowaDillyStatus,
  SyncModeScenarioLoad: SyncModeScenarioLoad,
  CtrlCmd: CtrlCmd,
  IntscnTL: IntscnTL,
  CollisionData: CollisionData,
  SyncModeInfo: SyncModeInfo,
  GhostMessage: GhostMessage,
  MapSpec: MapSpec,
  VehicleSpec: VehicleSpec,
  RadarDetection: RadarDetection,
  DillyCmdResponse: DillyCmdResponse,
  MapSpecIndex: MapSpecIndex,
  NpcGhostInfo: NpcGhostInfo,
  EventInfo: EventInfo,
  MoraiTLInfo: MoraiTLInfo,
  SaveSensorData: SaveSensorData,
  FaultStatusInfo_Overall: FaultStatusInfo_Overall,
  MultiEgoSetting: MultiEgoSetting,
  FaultStatusInfo: FaultStatusInfo,
  SkateboardStatus: SkateboardStatus,
  MultiPlayEventRequest: MultiPlayEventRequest,
  MoraiSrvResponse: MoraiSrvResponse,
  SyncModeCmdResponse: SyncModeCmdResponse,
  MoraiSimProcStatus: MoraiSimProcStatus,
  SensorPosControl: SensorPosControl,
  WaitForTickResponse: WaitForTickResponse,
  PRCtrlCmd: PRCtrlCmd,
  IntersectionControl: IntersectionControl,
  GPSMessage: GPSMessage,
  SetTrafficLight: SetTrafficLight,
  DillyCmd: DillyCmd,
  SyncModeCmd: SyncModeCmd,
  SyncModeResultResponse: SyncModeResultResponse,
  NpcGhostCmd: NpcGhostCmd,
  ObjectStatusExtended: ObjectStatusExtended,
  VehicleCollisionData: VehicleCollisionData,
  DdCtrlCmd: DdCtrlCmd,
  VehicleCollision: VehicleCollision,
  ReplayInfo: ReplayInfo,
};
