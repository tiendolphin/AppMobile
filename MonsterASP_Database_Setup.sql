-- DATABASE SETUP SCRIPT FOR MONSTERASP.NET MSSQL (db77818)
-- GENERATED AT: 11/04/2026 05:42:33

CREATE TABLE [AuditLogs] (
    [AuditId] int NOT NULL IDENTITY,
    [UserId] int NULL,
    [CompanyId] int NULL,
    [Action] nvarchar(100) NOT NULL,
    [EntityName] nvarchar(80) NOT NULL,
    [EntityId] nvarchar(80) NULL,
    [Details] nvarchar(2000) NULL,
    [IpAddress] nvarchar(60) NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_AuditLogs] PRIMARY KEY ([AuditId])
);
GO


CREATE TABLE [BusCompanies] (
    [CompanyId] int NOT NULL IDENTITY,
    [Name] nvarchar(150) NOT NULL,
    [TaxCode] nvarchar(50) NOT NULL,
    [Address] nvarchar(250) NOT NULL,
    [Phone] nvarchar(30) NOT NULL,
    [Email] nvarchar(150) NULL,
    [LogoUrl] nvarchar(300) NULL,
    [Description] nvarchar(1000) NULL,
    [RepresentativeName] nvarchar(120) NULL,
    [Status] nvarchar(30) NOT NULL,
    [RejectionReason] nvarchar(500) NULL,
    [AllowCod] bit NOT NULL,
    [MaxCodSeatsPerBooking] int NOT NULL,
    [SeatHoldMinutes] int NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_BusCompanies] PRIMARY KEY ([CompanyId])
);
GO


CREATE TABLE [InvoiceRequests] (
    [InvoiceRequestId] int NOT NULL IDENTITY,
    [BookingId] int NOT NULL,
    [BookingCode] nvarchar(40) NOT NULL,
    [TaxCode] nvarchar(40) NOT NULL,
    [CompanyName] nvarchar(200) NOT NULL,
    [CompanyAddress] nvarchar(300) NOT NULL,
    [BuyerEmail] nvarchar(150) NOT NULL,
    [TotalAmount] decimal(18,2) NOT NULL,
    [VatAmount] decimal(18,2) NOT NULL,
    [InvoiceNumber] nvarchar(60) NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [IssuedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_InvoiceRequests] PRIMARY KEY ([InvoiceRequestId])
);
GO


CREATE TABLE [Promotions] (
    [PromotionId] int NOT NULL IDENTITY,
    [Code] nvarchar(50) NOT NULL,
    [Description] nvarchar(250) NOT NULL,
    [DiscountType] nvarchar(20) NOT NULL,
    [DiscountValue] decimal(18,2) NOT NULL,
    [MaxDiscountAmount] decimal(18,2) NOT NULL,
    [UsageLimit] int NOT NULL,
    [UsedCount] int NOT NULL,
    [ExpiresAt] datetime2 NOT NULL,
    [IsActive] bit NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_Promotions] PRIMARY KEY ([PromotionId])
);
GO


CREATE TABLE [Provinces] (
    [ProvinceId] int NOT NULL IDENTITY,
    [Name] nvarchar(100) NOT NULL,
    [Code] nvarchar(20) NOT NULL,
    CONSTRAINT [PK_Provinces] PRIMARY KEY ([ProvinceId])
);
GO


CREATE TABLE [Roles] (
    [RoleId] int NOT NULL IDENTITY,
    [RoleName] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY ([RoleId])
);
GO


CREATE TABLE [SavedCompanions] (
    [CompanionId] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [FullName] nvarchar(120) NOT NULL,
    [Phone] nvarchar(30) NOT NULL,
    [Relationship] nvarchar(60) NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_SavedCompanions] PRIMARY KEY ([CompanionId])
);
GO


CREATE TABLE [ShuttleRequests] (
    [ShuttleRequestId] int NOT NULL IDENTITY,
    [BookingId] int NOT NULL,
    [TripId] int NOT NULL,
    [CompanyId] int NOT NULL,
    [PassengerName] nvarchar(120) NOT NULL,
    [PassengerPhone] nvarchar(30) NOT NULL,
    [PickupAddress] nvarchar(300) NOT NULL,
    [DropoffAddress] nvarchar(300) NULL,
    [PickupArea] nvarchar(100) NOT NULL,
    [ShuttlePlate] nvarchar(100) NULL,
    [Status] nvarchar(30) NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_ShuttleRequests] PRIMARY KEY ([ShuttleRequestId])
);
GO


CREATE TABLE [TripExpenses] (
    [ExpenseId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [CompanyId] int NOT NULL,
    [Category] nvarchar(60) NOT NULL,
    [Amount] decimal(18,2) NOT NULL,
    [Note] nvarchar(300) NOT NULL,
    [RecordedByUserId] int NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_TripExpenses] PRIMARY KEY ([ExpenseId])
);
GO


CREATE TABLE [TripSafetyChecks] (
    [SafetyCheckId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [DriverId] int NOT NULL,
    [BrakesOk] bit NOT NULL,
    [TiresOk] bit NOT NULL,
    [FireExtinguisherOk] bit NOT NULL,
    [DashcamOk] bit NOT NULL,
    [ZeroAlcoholConfirmed] bit NOT NULL,
    [Note] nvarchar(300) NULL,
    [CheckedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_TripSafetyChecks] PRIMARY KEY ([SafetyCheckId])
);
GO


CREATE TABLE [TripWaitlists] (
    [WaitlistId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [UserId] int NOT NULL,
    [CustomerName] nvarchar(120) NOT NULL,
    [CustomerPhone] nvarchar(30) NOT NULL,
    [SeatCountRequested] int NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    [NotifiedAt] datetime2 NULL,
    CONSTRAINT [PK_TripWaitlists] PRIMARY KEY ([WaitlistId])
);
GO


CREATE TABLE [Users] (
    [UserId] int NOT NULL IDENTITY,
    [FullName] nvarchar(120) NOT NULL,
    [Email] nvarchar(150) NOT NULL,
    [Phone] nvarchar(25) NOT NULL,
    [PasswordHash] nvarchar(max) NOT NULL,
    [IsActive] bit NOT NULL,
    [NoShowCount] int NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY ([UserId])
);
GO


CREATE TABLE [Buses] (
    [BusId] int NOT NULL IDENTITY,
    [CompanyId] int NOT NULL,
    [PlateNumber] nvarchar(30) NOT NULL,
    [BusType] nvarchar(50) NOT NULL,
    [BrandModel] nvarchar(100) NOT NULL,
    [TotalSeats] int NOT NULL,
    [ManufactureYear] int NOT NULL,
    [TurnaroundMinutes] int NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    CONSTRAINT [PK_Buses] PRIMARY KEY ([BusId]),
    CONSTRAINT [FK_Buses_BusCompanies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [BusCompanies] ([CompanyId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Routes] (
    [RouteId] int NOT NULL IDENTITY,
    [CompanyId] int NOT NULL,
    [OriginProvinceId] int NOT NULL,
    [DestinationProvinceId] int NOT NULL,
    [Name] nvarchar(180) NOT NULL,
    [DistanceKm] int NOT NULL,
    [EstimatedDurationMinutes] int NOT NULL,
    [IsActive] bit NOT NULL,
    CONSTRAINT [PK_Routes] PRIMARY KEY ([RouteId]),
    CONSTRAINT [FK_Routes_BusCompanies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [BusCompanies] ([CompanyId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Routes_Provinces_DestinationProvinceId] FOREIGN KEY ([DestinationProvinceId]) REFERENCES [Provinces] ([ProvinceId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Routes_Provinces_OriginProvinceId] FOREIGN KEY ([OriginProvinceId]) REFERENCES [Provinces] ([ProvinceId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [CompanyMembers] (
    [CompanyMemberId] int NOT NULL IDENTITY,
    [CompanyId] int NOT NULL,
    [UserId] int NOT NULL,
    [MemberRole] nvarchar(50) NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [JoinedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_CompanyMembers] PRIMARY KEY ([CompanyMemberId]),
    CONSTRAINT [FK_CompanyMembers_BusCompanies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [BusCompanies] ([CompanyId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_CompanyMembers_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Drivers] (
    [DriverId] int NOT NULL IDENTITY,
    [CompanyId] int NOT NULL,
    [UserId] int NULL,
    [FullName] nvarchar(120) NOT NULL,
    [Phone] nvarchar(30) NOT NULL,
    [LicenseNumber] nvarchar(50) NOT NULL,
    [LicenseClass] nvarchar(20) NOT NULL,
    [LicenseExpiry] datetime2 NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    CONSTRAINT [PK_Drivers] PRIMARY KEY ([DriverId]),
    CONSTRAINT [FK_Drivers_BusCompanies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [BusCompanies] ([CompanyId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Drivers_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Notifications] (
    [NotificationId] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [Title] nvarchar(180) NOT NULL,
    [Content] nvarchar(1000) NOT NULL,
    [Type] nvarchar(50) NOT NULL,
    [ReferenceId] int NULL,
    [IsRead] bit NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_Notifications] PRIMARY KEY ([NotificationId]),
    CONSTRAINT [FK_Notifications_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [RefreshTokens] (
    [TokenId] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [TokenHash] nvarchar(256) NOT NULL,
    [ExpiresAt] datetime2 NOT NULL,
    [RevokedAt] datetime2 NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_RefreshTokens] PRIMARY KEY ([TokenId]),
    CONSTRAINT [FK_RefreshTokens_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [SupportRequests] (
    [RequestId] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [CompanyId] int NULL,
    [BookingId] int NULL,
    [Subject] nvarchar(200) NOT NULL,
    [Content] nvarchar(2000) NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [HandledByUserId] int NULL,
    [ReplyContent] nvarchar(2000) NULL,
    [CreatedAt] datetime2 NOT NULL,
    [UpdatedAt] datetime2 NULL,
    CONSTRAINT [PK_SupportRequests] PRIMARY KEY ([RequestId]),
    CONSTRAINT [FK_SupportRequests_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [UserDevices] (
    [DeviceId] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [FcmToken] nvarchar(512) NOT NULL,
    [DevicePlatform] nvarchar(50) NOT NULL,
    [LastSeenAt] datetime2 NOT NULL,
    CONSTRAINT [PK_UserDevices] PRIMARY KEY ([DeviceId]),
    CONSTRAINT [FK_UserDevices_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [UserRoles] (
    [UserRoleId] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [RoleId] int NOT NULL,
    [CompanyId] int NULL,
    CONSTRAINT [PK_UserRoles] PRIMARY KEY ([UserRoleId]),
    CONSTRAINT [FK_UserRoles_BusCompanies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [BusCompanies] ([CompanyId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([RoleId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [BusMaintenances] (
    [MaintenanceId] int NOT NULL IDENTITY,
    [BusId] int NOT NULL,
    [StartAt] datetime2 NOT NULL,
    [EndAt] datetime2 NOT NULL,
    [Description] nvarchar(500) NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    CONSTRAINT [PK_BusMaintenances] PRIMARY KEY ([MaintenanceId]),
    CONSTRAINT [FK_BusMaintenances_Buses_BusId] FOREIGN KEY ([BusId]) REFERENCES [Buses] ([BusId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [BusSeats] (
    [BusSeatId] int NOT NULL IDENTITY,
    [BusId] int NOT NULL,
    [SeatCode] nvarchar(20) NOT NULL,
    [Deck] int NOT NULL,
    [Row] int NOT NULL,
    [Column] int NOT NULL,
    [SeatType] nvarchar(30) NOT NULL,
    [PriceSurcharge] decimal(18,2) NOT NULL,
    [IsActive] bit NOT NULL,
    CONSTRAINT [PK_BusSeats] PRIMARY KEY ([BusSeatId]),
    CONSTRAINT [FK_BusSeats_Buses_BusId] FOREIGN KEY ([BusId]) REFERENCES [Buses] ([BusId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [RouteStops] (
    [RouteStopId] int NOT NULL IDENTITY,
    [RouteId] int NOT NULL,
    [StopName] nvarchar(150) NOT NULL,
    [Address] nvarchar(250) NOT NULL,
    [Sequence] int NOT NULL,
    [OffsetMinutes] int NOT NULL,
    [Surcharge] decimal(18,2) NOT NULL,
    [Latitude] float NOT NULL,
    [Longitude] float NOT NULL,
    [StopType] nvarchar(30) NOT NULL,
    CONSTRAINT [PK_RouteStops] PRIMARY KEY ([RouteStopId]),
    CONSTRAINT [FK_RouteStops_Routes_RouteId] FOREIGN KEY ([RouteId]) REFERENCES [Routes] ([RouteId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Trips] (
    [TripId] int NOT NULL IDENTITY,
    [CompanyId] int NOT NULL,
    [RouteId] int NOT NULL,
    [BusId] int NOT NULL,
    [DepartureAt] datetime2 NOT NULL,
    [ArrivalEstimate] datetime2 NOT NULL,
    [DelayedArrivalEstimate] datetime2 NULL,
    [DelayReason] nvarchar(300) NULL,
    [BasePrice] decimal(18,2) NOT NULL,
    [SaleOpenAt] datetime2 NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_Trips] PRIMARY KEY ([TripId]),
    CONSTRAINT [FK_Trips_BusCompanies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [BusCompanies] ([CompanyId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Trips_Buses_BusId] FOREIGN KEY ([BusId]) REFERENCES [Buses] ([BusId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Trips_Routes_RouteId] FOREIGN KEY ([RouteId]) REFERENCES [Routes] ([RouteId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [DriverDocuments] (
    [DocumentId] int NOT NULL IDENTITY,
    [DriverId] int NOT NULL,
    [FileUrl] nvarchar(400) NOT NULL,
    [Type] nvarchar(50) NOT NULL,
    [ExpiryDate] datetime2 NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    CONSTRAINT [PK_DriverDocuments] PRIMARY KEY ([DocumentId]),
    CONSTRAINT [FK_DriverDocuments_Drivers_DriverId] FOREIGN KEY ([DriverId]) REFERENCES [Drivers] ([DriverId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Bookings] (
    [BookingId] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [TripId] int NOT NULL,
    [LinkedBookingId] int NULL,
    [BookingCode] nvarchar(40) NOT NULL,
    [HoldToken] nvarchar(100) NULL,
    [ContactName] nvarchar(120) NOT NULL,
    [ContactPhone] nvarchar(30) NOT NULL,
    [ContactEmail] nvarchar(150) NULL,
    [SubTotal] decimal(18,2) NOT NULL,
    [SurchargeTotal] decimal(18,2) NOT NULL,
    [DiscountAmount] decimal(18,2) NOT NULL,
    [TotalAmount] decimal(18,2) NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [CancelReason] nvarchar(500) NULL,
    [CreatedAt] datetime2 NOT NULL,
    [ExpiresAt] datetime2 NOT NULL,
    CONSTRAINT [PK_Bookings] PRIMARY KEY ([BookingId]),
    CONSTRAINT [FK_Bookings_Trips_TripId] FOREIGN KEY ([TripId]) REFERENCES [Trips] ([TripId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Bookings_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [CargoShipments] (
    [ShipmentId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [CompanyId] int NOT NULL,
    [TrackingCode] nvarchar(40) NOT NULL,
    [SenderName] nvarchar(120) NOT NULL,
    [SenderPhone] nvarchar(30) NOT NULL,
    [ReceiverName] nvarchar(120) NOT NULL,
    [ReceiverPhone] nvarchar(30) NOT NULL,
    [Description] nvarchar(300) NOT NULL,
    [WeightKg] float NOT NULL,
    [FeeAmount] decimal(18,2) NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_CargoShipments] PRIMARY KEY ([ShipmentId]),
    CONSTRAINT [FK_CargoShipments_Trips_TripId] FOREIGN KEY ([TripId]) REFERENCES [Trips] ([TripId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [DriverAssignments] (
    [AssignmentId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [DriverId] int NOT NULL,
    [Role] nvarchar(30) NOT NULL,
    [AssignedAt] datetime2 NOT NULL,
    [ReleasedAt] datetime2 NULL,
    [ReplaceReason] nvarchar(300) NULL,
    CONSTRAINT [PK_DriverAssignments] PRIMARY KEY ([AssignmentId]),
    CONSTRAINT [FK_DriverAssignments_Drivers_DriverId] FOREIGN KEY ([DriverId]) REFERENCES [Drivers] ([DriverId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_DriverAssignments_Trips_TripId] FOREIGN KEY ([TripId]) REFERENCES [Trips] ([TripId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [TripIncidents] (
    [IncidentId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [DriverId] int NOT NULL,
    [Type] nvarchar(80) NOT NULL,
    [Description] nvarchar(500) NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_TripIncidents] PRIMARY KEY ([IncidentId]),
    CONSTRAINT [FK_TripIncidents_Drivers_DriverId] FOREIGN KEY ([DriverId]) REFERENCES [Drivers] ([DriverId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_TripIncidents_Trips_TripId] FOREIGN KEY ([TripId]) REFERENCES [Trips] ([TripId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [TripLiveLocations] (
    [TripId] int NOT NULL,
    [DriverId] int NOT NULL,
    [Latitude] float NOT NULL,
    [Longitude] float NOT NULL,
    [SpeedKmh] float NOT NULL,
    [Accuracy] float NOT NULL,
    [UpdatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_TripLiveLocations] PRIMARY KEY ([TripId]),
    CONSTRAINT [FK_TripLiveLocations_Trips_TripId] FOREIGN KEY ([TripId]) REFERENCES [Trips] ([TripId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [TripLocations] (
    [LocationId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [DriverId] int NOT NULL,
    [Latitude] float NOT NULL,
    [Longitude] float NOT NULL,
    [SpeedKmh] float NOT NULL,
    [Accuracy] float NOT NULL,
    [RecordedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_TripLocations] PRIMARY KEY ([LocationId]),
    CONSTRAINT [FK_TripLocations_Drivers_DriverId] FOREIGN KEY ([DriverId]) REFERENCES [Drivers] ([DriverId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_TripLocations_Trips_TripId] FOREIGN KEY ([TripId]) REFERENCES [Trips] ([TripId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [TripMessages] (
    [MessageId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [BookingId] int NULL,
    [SenderUserId] int NOT NULL,
    [SenderName] nvarchar(100) NOT NULL,
    [SenderRole] nvarchar(30) NOT NULL,
    [Content] nvarchar(1000) NOT NULL,
    [IsRead] bit NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_TripMessages] PRIMARY KEY ([MessageId]),
    CONSTRAINT [FK_TripMessages_Trips_TripId] FOREIGN KEY ([TripId]) REFERENCES [Trips] ([TripId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_TripMessages_Users_SenderUserId] FOREIGN KEY ([SenderUserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [TripSeats] (
    [TripSeatId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [BusSeatId] int NOT NULL,
    [SeatCode] nvarchar(20) NOT NULL,
    [Deck] int NOT NULL,
    [Row] int NOT NULL,
    [Column] int NOT NULL,
    [SeatStatus] nvarchar(30) NOT NULL,
    [CurrentPrice] decimal(18,2) NOT NULL,
    [RowVersion] rowversion NULL,
    CONSTRAINT [PK_TripSeats] PRIMARY KEY ([TripSeatId]),
    CONSTRAINT [FK_TripSeats_BusSeats_BusSeatId] FOREIGN KEY ([BusSeatId]) REFERENCES [BusSeats] ([BusSeatId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_TripSeats_Trips_TripId] FOREIGN KEY ([TripId]) REFERENCES [Trips] ([TripId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [TripStatusHistories] (
    [HistoryId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [OldStatus] nvarchar(30) NOT NULL,
    [NewStatus] nvarchar(30) NOT NULL,
    [ChangedByUserId] int NULL,
    [ChangedAt] datetime2 NOT NULL,
    [Reason] nvarchar(500) NULL,
    CONSTRAINT [PK_TripStatusHistories] PRIMARY KEY ([HistoryId]),
    CONSTRAINT [FK_TripStatusHistories_Trips_TripId] FOREIGN KEY ([TripId]) REFERENCES [Trips] ([TripId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Payments] (
    [PaymentId] int NOT NULL IDENTITY,
    [BookingId] int NOT NULL,
    [Method] nvarchar(30) NOT NULL,
    [Amount] decimal(18,2) NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [CollectedByUserId] int NULL,
    [PaidAt] datetime2 NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_Payments] PRIMARY KEY ([PaymentId]),
    CONSTRAINT [FK_Payments_Bookings_BookingId] FOREIGN KEY ([BookingId]) REFERENCES [Bookings] ([BookingId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Reviews] (
    [ReviewId] int NOT NULL IDENTITY,
    [BookingId] int NOT NULL,
    [TripId] int NOT NULL,
    [CompanyId] int NOT NULL,
    [UserId] int NOT NULL,
    [Rating] int NOT NULL,
    [Comment] nvarchar(1000) NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_Reviews] PRIMARY KEY ([ReviewId]),
    CONSTRAINT [FK_Reviews_Bookings_BookingId] FOREIGN KEY ([BookingId]) REFERENCES [Bookings] ([BookingId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Reviews_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [BookingDetails] (
    [BookingDetailId] int NOT NULL IDENTITY,
    [BookingId] int NOT NULL,
    [TripSeatId] int NOT NULL,
    [SeatCode] nvarchar(20) NOT NULL,
    [PassengerName] nvarchar(120) NOT NULL,
    [PassengerPhone] nvarchar(30) NULL,
    [PickupStopId] int NULL,
    [DropoffStopId] int NULL,
    [UnitPrice] decimal(18,2) NOT NULL,
    [Surcharge] decimal(18,2) NOT NULL,
    [IsActiveBooking] bit NOT NULL,
    CONSTRAINT [PK_BookingDetails] PRIMARY KEY ([BookingDetailId]),
    CONSTRAINT [FK_BookingDetails_Bookings_BookingId] FOREIGN KEY ([BookingId]) REFERENCES [Bookings] ([BookingId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_BookingDetails_RouteStops_DropoffStopId] FOREIGN KEY ([DropoffStopId]) REFERENCES [RouteStops] ([RouteStopId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_BookingDetails_RouteStops_PickupStopId] FOREIGN KEY ([PickupStopId]) REFERENCES [RouteStops] ([RouteStopId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_BookingDetails_TripSeats_TripSeatId] FOREIGN KEY ([TripSeatId]) REFERENCES [TripSeats] ([TripSeatId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [SeatHolds] (
    [HoldId] int NOT NULL IDENTITY,
    [TripId] int NOT NULL,
    [TripSeatId] int NOT NULL,
    [UserId] int NOT NULL,
    [HoldToken] nvarchar(100) NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    [HoldExpiresAt] datetime2 NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    CONSTRAINT [PK_SeatHolds] PRIMARY KEY ([HoldId]),
    CONSTRAINT [FK_SeatHolds_TripSeats_TripSeatId] FOREIGN KEY ([TripSeatId]) REFERENCES [TripSeats] ([TripSeatId]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SeatHolds_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [PaymentTransactions] (
    [TransactionId] int NOT NULL IDENTITY,
    [PaymentId] int NOT NULL,
    [ProviderRef] nvarchar(100) NOT NULL,
    [TxnRef] nvarchar(100) NOT NULL,
    [ResponseCode] nvarchar(20) NOT NULL,
    [RawStatus] nvarchar(40) NOT NULL,
    [RawPayload] nvarchar(2000) NULL,
    [SignatureValid] bit NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_PaymentTransactions] PRIMARY KEY ([TransactionId]),
    CONSTRAINT [FK_PaymentTransactions_Payments_PaymentId] FOREIGN KEY ([PaymentId]) REFERENCES [Payments] ([PaymentId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Refunds] (
    [RefundId] int NOT NULL IDENTITY,
    [PaymentId] int NOT NULL,
    [BookingId] int NOT NULL,
    [Amount] decimal(18,2) NOT NULL,
    [Reason] nvarchar(500) NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [ProcessedByUserId] int NULL,
    [RequestedAt] datetime2 NOT NULL,
    [CompletedAt] datetime2 NULL,
    CONSTRAINT [PK_Refunds] PRIMARY KEY ([RefundId]),
    CONSTRAINT [FK_Refunds_Payments_PaymentId] FOREIGN KEY ([PaymentId]) REFERENCES [Payments] ([PaymentId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Tickets] (
    [TicketId] int NOT NULL IDENTITY,
    [BookingDetailId] int NOT NULL,
    [TripId] int NOT NULL,
    [TicketCode] nvarchar(50) NOT NULL,
    [QRTokenHash] nvarchar(256) NOT NULL,
    [QRDisplayPayload] nvarchar(300) NOT NULL,
    [Status] nvarchar(30) NOT NULL,
    [IssuedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_Tickets] PRIMARY KEY ([TicketId]),
    CONSTRAINT [FK_Tickets_BookingDetails_BookingDetailId] FOREIGN KEY ([BookingDetailId]) REFERENCES [BookingDetails] ([BookingDetailId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [TicketCheckIns] (
    [CheckInId] int NOT NULL IDENTITY,
    [TicketId] int NOT NULL,
    [CheckedByUserId] int NOT NULL,
    [DeviceInfo] nvarchar(150) NULL,
    [CheckedAt] datetime2 NOT NULL,
    [Result] nvarchar(50) NOT NULL,
    [Note] nvarchar(300) NULL,
    CONSTRAINT [PK_TicketCheckIns] PRIMARY KEY ([CheckInId]),
    CONSTRAINT [FK_TicketCheckIns_Tickets_TicketId] FOREIGN KEY ([TicketId]) REFERENCES [Tickets] ([TicketId]) ON DELETE NO ACTION
);
GO


CREATE INDEX [IX_BookingDetails_BookingId] ON [BookingDetails] ([BookingId]);
GO


CREATE INDEX [IX_BookingDetails_DropoffStopId] ON [BookingDetails] ([DropoffStopId]);
GO


CREATE INDEX [IX_BookingDetails_PickupStopId] ON [BookingDetails] ([PickupStopId]);
GO


CREATE UNIQUE INDEX [IX_BookingDetails_TripSeatId] ON [BookingDetails] ([TripSeatId]) WHERE [IsActiveBooking] = 1;
GO


CREATE UNIQUE INDEX [IX_Bookings_BookingCode] ON [Bookings] ([BookingCode]);
GO


CREATE INDEX [IX_Bookings_TripId] ON [Bookings] ([TripId]);
GO


CREATE INDEX [IX_Bookings_UserId] ON [Bookings] ([UserId]);
GO


CREATE INDEX [IX_Buses_CompanyId] ON [Buses] ([CompanyId]);
GO


CREATE UNIQUE INDEX [IX_Buses_PlateNumber] ON [Buses] ([PlateNumber]);
GO


CREATE INDEX [IX_BusMaintenances_BusId] ON [BusMaintenances] ([BusId]);
GO


CREATE UNIQUE INDEX [IX_BusSeats_BusId_SeatCode] ON [BusSeats] ([BusId], [SeatCode]);
GO


CREATE INDEX [IX_CargoShipments_TripId] ON [CargoShipments] ([TripId]);
GO


CREATE INDEX [IX_CompanyMembers_CompanyId] ON [CompanyMembers] ([CompanyId]);
GO


CREATE INDEX [IX_CompanyMembers_UserId] ON [CompanyMembers] ([UserId]);
GO


CREATE INDEX [IX_DriverAssignments_DriverId] ON [DriverAssignments] ([DriverId]);
GO


CREATE INDEX [IX_DriverAssignments_TripId] ON [DriverAssignments] ([TripId]);
GO


CREATE INDEX [IX_DriverDocuments_DriverId] ON [DriverDocuments] ([DriverId]);
GO


CREATE INDEX [IX_Drivers_CompanyId] ON [Drivers] ([CompanyId]);
GO


CREATE INDEX [IX_Drivers_UserId] ON [Drivers] ([UserId]);
GO


CREATE INDEX [IX_Notifications_UserId] ON [Notifications] ([UserId]);
GO


CREATE INDEX [IX_Payments_BookingId] ON [Payments] ([BookingId]);
GO


CREATE INDEX [IX_PaymentTransactions_PaymentId] ON [PaymentTransactions] ([PaymentId]);
GO


CREATE INDEX [IX_RefreshTokens_UserId] ON [RefreshTokens] ([UserId]);
GO


CREATE INDEX [IX_Refunds_PaymentId] ON [Refunds] ([PaymentId]);
GO


CREATE INDEX [IX_Reviews_BookingId] ON [Reviews] ([BookingId]);
GO


CREATE INDEX [IX_Reviews_UserId] ON [Reviews] ([UserId]);
GO


CREATE UNIQUE INDEX [IX_Roles_RoleName] ON [Roles] ([RoleName]);
GO


CREATE INDEX [IX_Routes_CompanyId] ON [Routes] ([CompanyId]);
GO


CREATE INDEX [IX_Routes_DestinationProvinceId] ON [Routes] ([DestinationProvinceId]);
GO


CREATE INDEX [IX_Routes_OriginProvinceId] ON [Routes] ([OriginProvinceId]);
GO


CREATE INDEX [IX_RouteStops_RouteId] ON [RouteStops] ([RouteId]);
GO


CREATE INDEX [IX_SeatHolds_TripSeatId_Status_HoldExpiresAt] ON [SeatHolds] ([TripSeatId], [Status], [HoldExpiresAt]);
GO


CREATE INDEX [IX_SeatHolds_UserId] ON [SeatHolds] ([UserId]);
GO


CREATE INDEX [IX_SupportRequests_UserId] ON [SupportRequests] ([UserId]);
GO


CREATE INDEX [IX_TicketCheckIns_TicketId] ON [TicketCheckIns] ([TicketId]);
GO


CREATE UNIQUE INDEX [IX_Tickets_BookingDetailId] ON [Tickets] ([BookingDetailId]);
GO


CREATE UNIQUE INDEX [IX_Tickets_QRTokenHash] ON [Tickets] ([QRTokenHash]);
GO


CREATE UNIQUE INDEX [IX_Tickets_TicketCode] ON [Tickets] ([TicketCode]);
GO


CREATE INDEX [IX_TripIncidents_DriverId] ON [TripIncidents] ([DriverId]);
GO


CREATE INDEX [IX_TripIncidents_TripId] ON [TripIncidents] ([TripId]);
GO


CREATE INDEX [IX_TripLocations_DriverId] ON [TripLocations] ([DriverId]);
GO


CREATE INDEX [IX_TripLocations_TripId] ON [TripLocations] ([TripId]);
GO


CREATE INDEX [IX_TripMessages_SenderUserId] ON [TripMessages] ([SenderUserId]);
GO


CREATE INDEX [IX_TripMessages_TripId] ON [TripMessages] ([TripId]);
GO


CREATE INDEX [IX_Trips_BusId] ON [Trips] ([BusId]);
GO


CREATE INDEX [IX_Trips_CompanyId] ON [Trips] ([CompanyId]);
GO


CREATE INDEX [IX_Trips_RouteId_DepartureAt_Status] ON [Trips] ([RouteId], [DepartureAt], [Status]);
GO


CREATE INDEX [IX_TripSeats_BusSeatId] ON [TripSeats] ([BusSeatId]);
GO


CREATE UNIQUE INDEX [IX_TripSeats_TripId_SeatCode] ON [TripSeats] ([TripId], [SeatCode]);
GO


CREATE INDEX [IX_TripStatusHistories_TripId] ON [TripStatusHistories] ([TripId]);
GO


CREATE INDEX [IX_UserDevices_UserId] ON [UserDevices] ([UserId]);
GO


CREATE INDEX [IX_UserRoles_CompanyId] ON [UserRoles] ([CompanyId]);
GO


CREATE INDEX [IX_UserRoles_RoleId] ON [UserRoles] ([RoleId]);
GO


CREATE INDEX [IX_UserRoles_UserId] ON [UserRoles] ([UserId]);
GO


CREATE UNIQUE INDEX [IX_Users_Email] ON [Users] ([Email]);
GO




-- =============================================
-- MASTER SEED DATA
-- =============================================

-- ==================== DATA FOR Roles (5 rows) ====================
SET IDENTITY_INSERT [Roles] ON;
INSERT INTO [Roles] ([RoleId], [RoleName], [Description]) VALUES (1, N'Admin', N'Quản trị viên nền tảng');
INSERT INTO [Roles] ([RoleId], [RoleName], [Description]) VALUES (2, N'BusOperator', N'Quản lý nhà xe');
INSERT INTO [Roles] ([RoleId], [RoleName], [Description]) VALUES (3, N'Staff', N'Nhân viên nhà xe');
INSERT INTO [Roles] ([RoleId], [RoleName], [Description]) VALUES (4, N'Driver', N'Tài xế vận hành chuyến');
INSERT INTO [Roles] ([RoleId], [RoleName], [Description]) VALUES (5, N'Customer', N'Khách hàng đặt vé');
SET IDENTITY_INSERT [Roles] OFF;
GO

-- ==================== DATA FOR BusCompanies (3 rows) ====================
SET IDENTITY_INSERT [BusCompanies] ON;
INSERT INTO [BusCompanies] ([CompanyId], [Name], [TaxCode], [Address], [Phone], [Email], [LogoUrl], [Description], [RepresentativeName], [Status], [RejectionReason], [AllowCod], [MaxCodSeatsPerBooking], [SeatHoldMinutes], [CreatedAt]) VALUES (1, N'Phương Trang (FUTA Bus Lines)', N'0302241579', N'80 Trần Hưng Đạo, Quận 1, TP. Hồ Chí Minh', N'19006067', N'hotro@phuongtrang.vn', NULL, N'Nhà xe uy tín hàng đầu Việt Nam chuyên tuyến miền Nam - Tây Nguyên - miền Trung.', N'Nguyễn Hoàng Phương', N'Active', NULL, 1, 4, 10, '2026-11-02 18:30:23.378');
INSERT INTO [BusCompanies] ([CompanyId], [Name], [TaxCode], [Address], [Phone], [Email], [LogoUrl], [Description], [RepresentativeName], [Status], [RejectionReason], [AllowCod], [MaxCodSeatsPerBooking], [SeatHoldMinutes], [CreatedAt]) VALUES (2, N'Thành Bưởi Limousine', N'0301988241', N'266 Lê Hồng Phong, Quận 5, TP. Hồ Chí Minh', N'19006079', N'contact@thanhbuoi.vn', NULL, N'Chuyên xe phòng nằm VIP đi Đà Lạt, Cần Thơ.', N'Lê Thành Bưởi', N'Active', NULL, 1, 3, 10, '2026-11-02 18:30:23.378');
INSERT INTO [BusCompanies] ([CompanyId], [Name], [TaxCode], [Address], [Phone], [Email], [LogoUrl], [Description], [RepresentativeName], [Status], [RejectionReason], [AllowCod], [MaxCodSeatsPerBooking], [SeatHoldMinutes], [CreatedAt]) VALUES (3, N'Kumho Samco Buslines', N'0305112890', N'292 Đinh Bộ Lĩnh, Bình Thạnh, TP. Hồ Chí Minh', N'19006065', N'info@kumhosamco.com.vn', NULL, N'Nhà xe liên doanh Hàn Quốc chờ duyệt hoạt động.', N'Park Jin', N'Active', N'Quản trị viên nền tảng xét duyệt hồ sơ pháp lý', 0, 2, 10, '2026-11-02 18:30:23.378');
SET IDENTITY_INSERT [BusCompanies] OFF;
GO

-- ==================== DATA FOR Users (7 rows) ====================
SET IDENTITY_INSERT [Users] ON;
INSERT INTO [Users] ([UserId], [FullName], [Email], [Phone], [PasswordHash], [IsActive], [NoShowCount], [CreatedAt]) VALUES (1, N'Quản Trị Nền Tảng (Admin)', N'admin@busticket.vn', N'0901000001', N'xKIy25MP2jyIiMQh8bldgA==.PSeb9h45Jg27ZQWg3w7B5iMmVf4fZUk7pvBuaJpm6UQ=', 1, 0, '2026-11-02 18:30:23.429');
INSERT INTO [Users] ([UserId], [FullName], [Email], [Phone], [PasswordHash], [IsActive], [NoShowCount], [CreatedAt]) VALUES (2, N'Nguyễn Quản Lý (Phương Trang)', N'operator@phuongtrang.vn', N'0901000002', N'xKIy25MP2jyIiMQh8bldgA==.PSeb9h45Jg27ZQWg3w7B5iMmVf4fZUk7pvBuaJpm6UQ=', 1, 0, '2026-11-02 18:30:23.429');
INSERT INTO [Users] ([UserId], [FullName], [Email], [Phone], [PasswordHash], [IsActive], [NoShowCount], [CreatedAt]) VALUES (3, N'Lê Thu Ngân (NV Phương Trang)', N'staff@phuongtrang.vn', N'0901000003', N'xKIy25MP2jyIiMQh8bldgA==.PSeb9h45Jg27ZQWg3w7B5iMmVf4fZUk7pvBuaJpm6UQ=', 1, 0, '2026-11-02 18:30:23.429');
INSERT INTO [Users] ([UserId], [FullName], [Email], [Phone], [PasswordHash], [IsActive], [NoShowCount], [CreatedAt]) VALUES (4, N'Nguyễn Văn Tài (Tài xế FUTA)', N'driver@phuongtrang.vn', N'0901000004', N'xKIy25MP2jyIiMQh8bldgA==.PSeb9h45Jg27ZQWg3w7B5iMmVf4fZUk7pvBuaJpm6UQ=', 1, 0, '2026-11-02 18:30:23.429');
INSERT INTO [Users] ([UserId], [FullName], [Email], [Phone], [PasswordHash], [IsActive], [NoShowCount], [CreatedAt]) VALUES (5, N'Trần Quản Lý (Thành Bưởi)', N'operator@thanhbuoi.vn', N'0901000005', N'xKIy25MP2jyIiMQh8bldgA==.PSeb9h45Jg27ZQWg3w7B5iMmVf4fZUk7pvBuaJpm6UQ=', 1, 0, '2026-11-02 18:30:23.429');
INSERT INTO [Users] ([UserId], [FullName], [Email], [Phone], [PasswordHash], [IsActive], [NoShowCount], [CreatedAt]) VALUES (6, N'Trần Minh Khách', N'customer@gmail.vn', N'0988123456', N'xKIy25MP2jyIiMQh8bldgA==.PSeb9h45Jg27ZQWg3w7B5iMmVf4fZUk7pvBuaJpm6UQ=', 1, 1, '2026-11-02 18:30:23.429');
INSERT INTO [Users] ([UserId], [FullName], [Email], [Phone], [PasswordHash], [IsActive], [NoShowCount], [CreatedAt]) VALUES (7, N'Nguyễn Trọng Trí', N'trin99832@gmail.com', N'0386829864', N'2MYu/DdaJF0ncWBm+IzScw==.lvJefetuxBU+SEA0Yx7k/9C5yYcf+T7Jm6aHtfYcUog=', 1, 0, '2026-11-02 20:41:42.439');
SET IDENTITY_INSERT [Users] OFF;
GO

-- ==================== DATA FOR UserRoles (7 rows) ====================
SET IDENTITY_INSERT [UserRoles] ON;
INSERT INTO [UserRoles] ([UserRoleId], [UserId], [RoleId], [CompanyId]) VALUES (1, 1, 1, NULL);
INSERT INTO [UserRoles] ([UserRoleId], [UserId], [RoleId], [CompanyId]) VALUES (2, 2, 2, 1);
INSERT INTO [UserRoles] ([UserRoleId], [UserId], [RoleId], [CompanyId]) VALUES (3, 3, 3, 1);
INSERT INTO [UserRoles] ([UserRoleId], [UserId], [RoleId], [CompanyId]) VALUES (4, 4, 4, 1);
INSERT INTO [UserRoles] ([UserRoleId], [UserId], [RoleId], [CompanyId]) VALUES (5, 5, 2, 2);
INSERT INTO [UserRoles] ([UserRoleId], [UserId], [RoleId], [CompanyId]) VALUES (6, 6, 5, NULL);
INSERT INTO [UserRoles] ([UserRoleId], [UserId], [RoleId], [CompanyId]) VALUES (7, 7, 5, NULL);
SET IDENTITY_INSERT [UserRoles] OFF;
GO

-- ==================== DATA FOR Drivers (3 rows) ====================
SET IDENTITY_INSERT [Drivers] ON;
INSERT INTO [Drivers] ([DriverId], [CompanyId], [UserId], [FullName], [Phone], [LicenseNumber], [LicenseClass], [LicenseExpiry], [Status]) VALUES (1, 1, 4, N'Nguyễn Văn Tài', N'0901000004', N'790123456789', N'E', '2029-11-02 18:30:23.507', N'Active');
INSERT INTO [Drivers] ([DriverId], [CompanyId], [UserId], [FullName], [Phone], [LicenseNumber], [LicenseClass], [LicenseExpiry], [Status]) VALUES (2, 1, NULL, N'Lê Hoàng Nam', N'0909222333', N'790987654321', N'E', '2028-11-02 18:30:23.511', N'Active');
INSERT INTO [Drivers] ([DriverId], [CompanyId], [UserId], [FullName], [Phone], [LicenseNumber], [LicenseClass], [LicenseExpiry], [Status]) VALUES (3, 2, NULL, N'Phạm Quốc Bảo', N'0909444555', N'790555666777', N'E', '2028-11-02 18:30:23.511', N'Active');
SET IDENTITY_INSERT [Drivers] OFF;
GO

-- ==================== DATA FOR Buses (3 rows) ====================
SET IDENTITY_INSERT [Buses] ON;
INSERT INTO [Buses] ([BusId], [CompanyId], [PlateNumber], [BusType], [BrandModel], [TotalSeats], [ManufactureYear], [TurnaroundMinutes], [Status]) VALUES (1, 1, N'51B-288.99', N'Limousine 20 Phòng VIP', N'Thaco Mobihome Luxury', 20, 2025, 60, N'Active');
INSERT INTO [Buses] ([BusId], [CompanyId], [PlateNumber], [BusType], [BrandModel], [TotalSeats], [ManufactureYear], [TurnaroundMinutes], [Status]) VALUES (2, 1, N'51B-678.88', N'Giường nằm 24 chỗ', N'Hyundai Universe', 24, 2024, 60, N'Active');
INSERT INTO [Buses] ([BusId], [CompanyId], [PlateNumber], [BusType], [BrandModel], [TotalSeats], [ManufactureYear], [TurnaroundMinutes], [Status]) VALUES (3, 2, N'51B-999.11', N'Cabin Cung Điện 20 Phòng', N'KimLong 99', 20, 2025, 60, N'Active');
SET IDENTITY_INSERT [Buses] OFF;
GO

-- ==================== DATA FOR BusSeats (64 rows) ====================
SET IDENTITY_INSERT [BusSeats] ON;
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (1, 1, N'A01', 1, 1, 1, N'VIP', 20000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (2, 1, N'A02', 1, 1, 2, N'VIP', 20000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (3, 1, N'A03', 1, 2, 1, N'VIP', 20000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (4, 1, N'A04', 1, 2, 2, N'VIP', 20000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (5, 1, N'A05', 1, 3, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (6, 1, N'A06', 1, 3, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (7, 1, N'A07', 1, 4, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (8, 1, N'A08', 1, 4, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (9, 1, N'A09', 1, 5, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (10, 1, N'A10', 1, 5, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (11, 1, N'B01', 2, 1, 1, N'VIP', 20000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (12, 1, N'B02', 2, 1, 2, N'VIP', 20000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (13, 1, N'B03', 2, 2, 1, N'VIP', 20000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (14, 1, N'B04', 2, 2, 2, N'VIP', 20000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (15, 1, N'B05', 2, 3, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (16, 1, N'B06', 2, 3, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (17, 1, N'B07', 2, 4, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (18, 1, N'B08', 2, 4, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (19, 1, N'B09', 2, 5, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (20, 1, N'B10', 2, 5, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (21, 2, N'A01', 1, 1, 1, N'VIP', 10000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (22, 2, N'A02', 1, 1, 2, N'VIP', 10000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (23, 2, N'A03', 1, 2, 1, N'VIP', 10000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (24, 2, N'A04', 1, 2, 2, N'VIP', 10000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (25, 2, N'A05', 1, 3, 1, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (26, 2, N'A06', 1, 3, 2, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (27, 2, N'A07', 1, 4, 1, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (28, 2, N'A08', 1, 4, 2, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (29, 2, N'A09', 1, 5, 1, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (30, 2, N'A10', 1, 5, 2, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (31, 2, N'A11', 1, 6, 1, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (32, 2, N'A12', 1, 6, 2, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (33, 2, N'B01', 2, 1, 1, N'VIP', 10000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (34, 2, N'B02', 2, 1, 2, N'VIP', 10000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (35, 2, N'B03', 2, 2, 1, N'VIP', 10000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (36, 2, N'B04', 2, 2, 2, N'VIP', 10000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (37, 2, N'B05', 2, 3, 1, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (38, 2, N'B06', 2, 3, 2, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (39, 2, N'B07', 2, 4, 1, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (40, 2, N'B08', 2, 4, 2, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (41, 2, N'B09', 2, 5, 1, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (42, 2, N'B10', 2, 5, 2, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (43, 2, N'B11', 2, 6, 1, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (44, 2, N'B12', 2, 6, 2, N'Sleeper', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (45, 3, N'A01', 1, 1, 1, N'VIP', 30000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (46, 3, N'A02', 1, 1, 2, N'VIP', 30000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (47, 3, N'A03', 1, 2, 1, N'VIP', 30000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (48, 3, N'A04', 1, 2, 2, N'VIP', 30000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (49, 3, N'A05', 1, 3, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (50, 3, N'A06', 1, 3, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (51, 3, N'A07', 1, 4, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (52, 3, N'A08', 1, 4, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (53, 3, N'A09', 1, 5, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (54, 3, N'A10', 1, 5, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (55, 3, N'B01', 2, 1, 1, N'VIP', 30000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (56, 3, N'B02', 2, 1, 2, N'VIP', 30000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (57, 3, N'B03', 2, 2, 1, N'VIP', 30000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (58, 3, N'B04', 2, 2, 2, N'VIP', 30000.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (59, 3, N'B05', 2, 3, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (60, 3, N'B06', 2, 3, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (61, 3, N'B07', 2, 4, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (62, 3, N'B08', 2, 4, 2, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (63, 3, N'B09', 2, 5, 1, N'Cabin', 0.00, 1);
INSERT INTO [BusSeats] ([BusSeatId], [BusId], [SeatCode], [Deck], [Row], [Column], [SeatType], [PriceSurcharge], [IsActive]) VALUES (64, 3, N'B10', 2, 5, 2, N'Cabin', 0.00, 1);
SET IDENTITY_INSERT [BusSeats] OFF;
GO

-- ==================== DATA FOR Provinces (6 rows) ====================
SET IDENTITY_INSERT [Provinces] ON;
INSERT INTO [Provinces] ([ProvinceId], [Name], [Code]) VALUES (1, N'TP. Hồ Chí Minh', N'SGN');
INSERT INTO [Provinces] ([ProvinceId], [Name], [Code]) VALUES (2, N'Lâm Đồng (Đà Lạt)', N'DLI');
INSERT INTO [Provinces] ([ProvinceId], [Name], [Code]) VALUES (3, N'Khánh Hòa (Nha Trang)', N'CXR');
INSERT INTO [Provinces] ([ProvinceId], [Name], [Code]) VALUES (4, N'Bà Rịa - Vũng Tàu', N'VTG');
INSERT INTO [Provinces] ([ProvinceId], [Name], [Code]) VALUES (5, N'Cần Thơ', N'VCA');
INSERT INTO [Provinces] ([ProvinceId], [Name], [Code]) VALUES (6, N'Bình Thuận (Phan Thiết)', N'PTH');
SET IDENTITY_INSERT [Provinces] OFF;
GO

-- ==================== DATA FOR Routes (4 rows) ====================
SET IDENTITY_INSERT [Routes] ON;
INSERT INTO [Routes] ([RouteId], [CompanyId], [OriginProvinceId], [DestinationProvinceId], [Name], [DistanceKm], [EstimatedDurationMinutes], [IsActive]) VALUES (1, 1, 1, 2, N'TP. Hồ Chí Minh → Đà Lạt (Cao tốc Dầu Giây)', 310, 390, 1);
INSERT INTO [Routes] ([RouteId], [CompanyId], [OriginProvinceId], [DestinationProvinceId], [Name], [DistanceKm], [EstimatedDurationMinutes], [IsActive]) VALUES (2, 1, 2, 1, N'Đà Lạt → TP. Hồ Chí Minh', 310, 390, 1);
INSERT INTO [Routes] ([RouteId], [CompanyId], [OriginProvinceId], [DestinationProvinceId], [Name], [DistanceKm], [EstimatedDurationMinutes], [IsActive]) VALUES (3, 1, 1, 3, N'TP. Hồ Chí Minh → Nha Trang (Cao tốc Vĩnh Hảo)', 420, 450, 1);
INSERT INTO [Routes] ([RouteId], [CompanyId], [OriginProvinceId], [DestinationProvinceId], [Name], [DistanceKm], [EstimatedDurationMinutes], [IsActive]) VALUES (4, 2, 1, 2, N'TP. Hồ Chí Minh → Đà Lạt (Cung Điện Di Động)', 310, 380, 1);
SET IDENTITY_INSERT [Routes] OFF;
GO

-- ==================== DATA FOR RouteStops (11 rows) ====================
SET IDENTITY_INSERT [RouteStops] ON;
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (1, 1, N'Bến xe Miền Đông Mới', N'501 Hoàng Hữu Nam, TP. Thủ Đức, TP.HCM', 1, 0, 0.00, 10.8794, 106.8142, N'Pickup');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (2, 1, N'VP Hàng Xanh (Đón khách)', N'486 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2, 25, 0.00, 10.8015, 106.7114, N'Pickup');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (3, 1, N'Trạm dừng Bảo Lộc', N'280 Trần Phú, TP. Bảo Lộc, Lâm Đồng', 3, 210, 0.00, 11.5479, 107.8077, N'Dropoff');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (4, 1, N'Bến xe Liên tỉnh Đà Lạt', N'01 Tô Hiến Thành, Phường 3, TP. Đà Lạt', 4, 390, 0.00, 11.9267, 108.4451, N'Dropoff');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (5, 1, N'Trung chuyển Nội ô Chợ Đà Lạt (+15k)', N'Khu Hòa Bình, Phường 1, TP. Đà Lạt', 5, 410, 15000.00, 11.9428, 108.4369, N'Dropoff');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (6, 2, N'Bến xe Liên tỉnh Đà Lạt', N'01 Tô Hiến Thành, Đà Lạt', 1, 0, 0.00, 11.9267, 108.4451, N'Pickup');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (7, 2, N'Bến xe Miền Đông Mới', N'Thủ Đức, TP.HCM', 2, 390, 0.00, 10.8794, 106.8142, N'Dropoff');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (8, 3, N'Bến xe Miền Đông Mới', N'Thủ Đức, TP.HCM', 1, 0, 0.00, 10.8794, 106.8142, N'Pickup');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (9, 3, N'Bến xe Phía Nam Nha Trang', N'Đường 23/10, Vĩnh Trung, Nha Trang', 2, 450, 0.00, 12.2488, 109.1462, N'Dropoff');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (10, 4, N'VP Lê Hồng Phong Q.5', N'266 Lê Hồng Phong, Q.5, TP.HCM', 1, 0, 0.00, 10.7611, 106.6768, N'Pickup');
INSERT INTO [RouteStops] ([RouteStopId], [RouteId], [StopName], [Address], [Sequence], [OffsetMinutes], [Surcharge], [Latitude], [Longitude], [StopType]) VALUES (11, 4, N'VP Phan Bội Châu Đà Lạt', N'55 Phan Bội Châu, Đà Lạt', 2, 380, 0.00, 11.9435, 108.4382, N'Dropoff');
SET IDENTITY_INSERT [RouteStops] OFF;
GO

-- ==================== DATA FOR Trips (9 rows) ====================
SET IDENTITY_INSERT [Trips] ON;
INSERT INTO [Trips] ([TripId], [CompanyId], [RouteId], [BusId], [DepartureAt], [ArrivalEstimate], [DelayedArrivalEstimate], [DelayReason], [BasePrice], [SaleOpenAt], [Status], [CreatedAt]) VALUES (1, 1, 1, 1, '2026-11-02 22:00:00.000', '2026-11-03 04:30:00.000', NULL, NULL, 350000.00, '2026-10-26 18:30:23.707', N'Boarding', '2026-11-02 18:30:23.707');
INSERT INTO [Trips] ([TripId], [CompanyId], [RouteId], [BusId], [DepartureAt], [ArrivalEstimate], [DelayedArrivalEstimate], [DelayReason], [BasePrice], [SaleOpenAt], [Status], [CreatedAt]) VALUES (2, 1, 1, 2, '2026-11-03 08:00:00.000', '2026-11-03 14:30:00.000', NULL, NULL, 290000.00, '2026-10-26 18:30:23.917', N'Scheduled', '2026-11-02 18:30:23.917');
INSERT INTO [Trips] ([TripId], [CompanyId], [RouteId], [BusId], [DepartureAt], [ArrivalEstimate], [DelayedArrivalEstimate], [DelayReason], [BasePrice], [SaleOpenAt], [Status], [CreatedAt]) VALUES (3, 1, 1, 1, '2026-11-03 22:00:00.000', '2026-11-04 04:30:00.000', NULL, NULL, 350000.00, '2026-10-26 18:30:23.945', N'Scheduled', '2026-11-02 18:30:23.945');
INSERT INTO [Trips] ([TripId], [CompanyId], [RouteId], [BusId], [DepartureAt], [ArrivalEstimate], [DelayedArrivalEstimate], [DelayReason], [BasePrice], [SaleOpenAt], [Status], [CreatedAt]) VALUES (4, 2, 4, 3, '2026-11-03 23:00:00.000', '2026-11-04 05:20:00.000', NULL, NULL, 420000.00, '2026-10-26 18:30:23.952', N'Scheduled', '2026-11-02 18:30:23.952');
INSERT INTO [Trips] ([TripId], [CompanyId], [RouteId], [BusId], [DepartureAt], [ArrivalEstimate], [DelayedArrivalEstimate], [DelayReason], [BasePrice], [SaleOpenAt], [Status], [CreatedAt]) VALUES (5, 1, 3, 2, '2026-11-03 21:00:00.000', '2026-11-04 04:30:00.000', NULL, NULL, 320000.00, '2026-10-26 18:30:23.960', N'Scheduled', '2026-11-02 18:30:23.960');
INSERT INTO [Trips] ([TripId], [CompanyId], [RouteId], [BusId], [DepartureAt], [ArrivalEstimate], [DelayedArrivalEstimate], [DelayReason], [BasePrice], [SaleOpenAt], [Status], [CreatedAt]) VALUES (6, 1, 2, 1, '2026-11-04 13:00:00.000', '2026-11-04 19:30:00.000', NULL, NULL, 350000.00, '2026-10-26 18:30:23.968', N'Scheduled', '2026-11-02 18:30:23.968');
INSERT INTO [Trips] ([TripId], [CompanyId], [RouteId], [BusId], [DepartureAt], [ArrivalEstimate], [DelayedArrivalEstimate], [DelayReason], [BasePrice], [SaleOpenAt], [Status], [CreatedAt]) VALUES (7, 1, 1, 2, '2026-11-05 22:22:25.920', '2026-11-06 04:52:25.920', NULL, NULL, 350000.00, '2026-10-27 22:22:25.890', N'Scheduled', '2026-11-03 22:22:25.890');
INSERT INTO [Trips] ([TripId], [CompanyId], [RouteId], [BusId], [DepartureAt], [ArrivalEstimate], [DelayedArrivalEstimate], [DelayReason], [BasePrice], [SaleOpenAt], [Status], [CreatedAt]) VALUES (8, 1, 1, 2, '2026-11-06 22:22:25.920', '2026-11-07 04:52:25.920', NULL, NULL, 350000.00, '2026-10-27 22:22:26.073', N'Scheduled', '2026-11-03 22:22:26.073');
INSERT INTO [Trips] ([TripId], [CompanyId], [RouteId], [BusId], [DepartureAt], [ArrivalEstimate], [DelayedArrivalEstimate], [DelayReason], [BasePrice], [SaleOpenAt], [Status], [CreatedAt]) VALUES (9, 1, 1, 2, '2026-11-07 22:22:25.920', '2026-11-08 04:52:25.920', NULL, NULL, 350000.00, '2026-10-27 22:22:26.089', N'Scheduled', '2026-11-03 22:22:26.089');
SET IDENTITY_INSERT [Trips] OFF;
GO

-- ==================== DATA FOR TripSeats (200 rows) ====================
SET IDENTITY_INSERT [TripSeats] ON;
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (1, 1, 1, N'A01', 1, 1, 1, N'Booked', 370000.00, N'0 0 0 0 0 0 8 82');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (2, 1, 2, N'A02', 1, 1, 2, N'Booked', 370000.00, N'0 0 0 0 0 0 8 83');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (3, 1, 3, N'A03', 1, 2, 1, N'Booked', 370000.00, N'0 0 0 0 0 0 8 84');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (4, 1, 4, N'A04', 1, 2, 2, N'Booked', 370000.00, N'0 0 0 0 0 0 8 88');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (5, 1, 5, N'A05', 1, 3, 1, N'Booked', 350000.00, N'0 0 0 0 0 0 70 83');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (6, 1, 6, N'A06', 1, 3, 2, N'Booked', 350000.00, N'0 0 0 0 0 0 70 92');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (7, 1, 7, N'A07', 1, 4, 1, N'Booked', 350000.00, N'0 0 0 0 0 0 70 87');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (8, 1, 8, N'A08', 1, 4, 2, N'Booked', 350000.00, N'0 0 0 0 0 0 101 146');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (9, 1, 9, N'A09', 1, 5, 1, N'Booked', 350000.00, N'0 0 0 0 0 0 195 83');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (10, 1, 10, N'A10', 1, 5, 2, N'Booked', 350000.00, N'0 0 0 0 0 0 226 146');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (11, 1, 11, N'B01', 2, 1, 1, N'Available', 370000.00, N'0 0 0 0 0 1 33 19');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (12, 1, 12, N'B02', 2, 1, 2, N'Available', 370000.00, N'0 0 0 0 0 0 7 220');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (13, 1, 13, N'B03', 2, 2, 1, N'Available', 370000.00, N'0 0 0 0 0 0 7 221');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (14, 1, 14, N'B04', 2, 2, 2, N'Available', 370000.00, N'0 0 0 0 0 0 7 222');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (15, 1, 15, N'B05', 2, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 0 7 223');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (16, 1, 16, N'B06', 2, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 0 7 224');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (17, 1, 17, N'B07', 2, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 0 7 225');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (18, 1, 18, N'B08', 2, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 0 7 226');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (19, 1, 19, N'B09', 2, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 0 7 227');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (20, 1, 20, N'B10', 2, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 0 7 228');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (21, 2, 21, N'A01', 1, 1, 1, N'Available', 300000.00, N'0 0 0 0 0 0 7 229');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (22, 2, 22, N'A02', 1, 1, 2, N'Available', 300000.00, N'0 0 0 0 0 0 70 81');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (23, 2, 23, N'A03', 1, 2, 1, N'Available', 300000.00, N'0 0 0 0 0 0 7 231');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (24, 2, 24, N'A04', 1, 2, 2, N'Available', 300000.00, N'0 0 0 0 0 0 7 232');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (25, 2, 25, N'A05', 1, 3, 1, N'Available', 290000.00, N'0 0 0 0 0 0 7 233');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (26, 2, 26, N'A06', 1, 3, 2, N'Available', 290000.00, N'0 0 0 0 0 0 7 234');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (27, 2, 27, N'A07', 1, 4, 1, N'Available', 290000.00, N'0 0 0 0 0 0 7 235');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (28, 2, 28, N'A08', 1, 4, 2, N'Available', 290000.00, N'0 0 0 0 0 0 7 236');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (29, 2, 29, N'A09', 1, 5, 1, N'Available', 290000.00, N'0 0 0 0 0 0 7 237');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (30, 2, 30, N'A10', 1, 5, 2, N'Available', 290000.00, N'0 0 0 0 0 0 7 238');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (31, 2, 31, N'A11', 1, 6, 1, N'Available', 290000.00, N'0 0 0 0 0 0 7 239');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (32, 2, 32, N'A12', 1, 6, 2, N'Available', 290000.00, N'0 0 0 0 0 0 7 240');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (33, 2, 33, N'B01', 2, 1, 1, N'Available', 300000.00, N'0 0 0 0 0 0 7 241');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (34, 2, 34, N'B02', 2, 1, 2, N'Available', 300000.00, N'0 0 0 0 0 0 7 242');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (35, 2, 35, N'B03', 2, 2, 1, N'Available', 300000.00, N'0 0 0 0 0 0 7 243');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (36, 2, 36, N'B04', 2, 2, 2, N'Available', 300000.00, N'0 0 0 0 0 0 7 244');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (37, 2, 37, N'B05', 2, 3, 1, N'Available', 290000.00, N'0 0 0 0 0 0 7 245');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (38, 2, 38, N'B06', 2, 3, 2, N'Available', 290000.00, N'0 0 0 0 0 0 7 246');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (39, 2, 39, N'B07', 2, 4, 1, N'Available', 290000.00, N'0 0 0 0 0 0 7 247');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (40, 2, 40, N'B08', 2, 4, 2, N'Booked', 290000.00, N'0 0 0 0 0 0 70 89');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (41, 2, 41, N'B09', 2, 5, 1, N'Available', 290000.00, N'0 0 0 0 0 0 7 249');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (42, 2, 42, N'B10', 2, 5, 2, N'Available', 290000.00, N'0 0 0 0 0 0 7 250');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (43, 2, 43, N'B11', 2, 6, 1, N'Available', 290000.00, N'0 0 0 0 0 0 7 251');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (44, 2, 44, N'B12', 2, 6, 2, N'Available', 290000.00, N'0 0 0 0 0 0 7 252');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (45, 3, 1, N'A01', 1, 1, 1, N'Available', 370000.00, N'0 0 0 0 0 0 7 253');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (46, 3, 2, N'A02', 1, 1, 2, N'Available', 370000.00, N'0 0 0 0 0 0 7 254');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (47, 3, 3, N'A03', 1, 2, 1, N'Available', 370000.00, N'0 0 0 0 0 0 7 255');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (48, 3, 4, N'A04', 1, 2, 2, N'Available', 370000.00, N'0 0 0 0 0 0 8 1');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (49, 3, 5, N'A05', 1, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 2');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (50, 3, 6, N'A06', 1, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 3');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (51, 3, 7, N'A07', 1, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 4');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (52, 3, 8, N'A08', 1, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 5');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (53, 3, 9, N'A09', 1, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 6');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (54, 3, 10, N'A10', 1, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 7');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (55, 3, 11, N'B01', 2, 1, 1, N'Available', 370000.00, N'0 0 0 0 0 0 8 8');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (56, 3, 12, N'B02', 2, 1, 2, N'Available', 370000.00, N'0 0 0 0 0 0 8 9');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (57, 3, 13, N'B03', 2, 2, 1, N'Available', 370000.00, N'0 0 0 0 0 0 8 10');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (58, 3, 14, N'B04', 2, 2, 2, N'Available', 370000.00, N'0 0 0 0 0 0 8 11');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (59, 3, 15, N'B05', 2, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 12');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (60, 3, 16, N'B06', 2, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 13');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (61, 3, 17, N'B07', 2, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 14');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (62, 3, 18, N'B08', 2, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 15');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (63, 3, 19, N'B09', 2, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 16');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (64, 3, 20, N'B10', 2, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 17');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (65, 4, 45, N'A01', 1, 1, 1, N'Available', 450000.00, N'0 0 0 0 0 0 8 18');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (66, 4, 46, N'A02', 1, 1, 2, N'Available', 450000.00, N'0 0 0 0 0 0 8 19');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (67, 4, 47, N'A03', 1, 2, 1, N'Available', 450000.00, N'0 0 0 0 0 0 8 20');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (68, 4, 48, N'A04', 1, 2, 2, N'Available', 450000.00, N'0 0 0 0 0 0 8 21');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (69, 4, 49, N'A05', 1, 3, 1, N'Available', 420000.00, N'0 0 0 0 0 0 8 22');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (70, 4, 50, N'A06', 1, 3, 2, N'Available', 420000.00, N'0 0 0 0 0 0 8 23');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (71, 4, 51, N'A07', 1, 4, 1, N'Available', 420000.00, N'0 0 0 0 0 0 8 24');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (72, 4, 52, N'A08', 1, 4, 2, N'Available', 420000.00, N'0 0 0 0 0 0 8 25');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (73, 4, 53, N'A09', 1, 5, 1, N'Available', 420000.00, N'0 0 0 0 0 0 8 26');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (74, 4, 54, N'A10', 1, 5, 2, N'Available', 420000.00, N'0 0 0 0 0 0 8 27');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (75, 4, 55, N'B01', 2, 1, 1, N'Available', 450000.00, N'0 0 0 0 0 0 8 28');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (76, 4, 56, N'B02', 2, 1, 2, N'Available', 450000.00, N'0 0 0 0 0 0 8 29');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (77, 4, 57, N'B03', 2, 2, 1, N'Available', 450000.00, N'0 0 0 0 0 0 8 30');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (78, 4, 58, N'B04', 2, 2, 2, N'Available', 450000.00, N'0 0 0 0 0 0 8 31');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (79, 4, 59, N'B05', 2, 3, 1, N'Available', 420000.00, N'0 0 0 0 0 0 8 32');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (80, 4, 60, N'B06', 2, 3, 2, N'Available', 420000.00, N'0 0 0 0 0 0 8 33');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (81, 4, 61, N'B07', 2, 4, 1, N'Available', 420000.00, N'0 0 0 0 0 0 8 34');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (82, 4, 62, N'B08', 2, 4, 2, N'Available', 420000.00, N'0 0 0 0 0 0 8 35');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (83, 4, 63, N'B09', 2, 5, 1, N'Available', 420000.00, N'0 0 0 0 0 0 8 36');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (84, 4, 64, N'B10', 2, 5, 2, N'Available', 420000.00, N'0 0 0 0 0 0 8 37');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (85, 5, 21, N'A01', 1, 1, 1, N'Available', 330000.00, N'0 0 0 0 0 0 8 38');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (86, 5, 22, N'A02', 1, 1, 2, N'Available', 330000.00, N'0 0 0 0 0 0 8 39');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (87, 5, 23, N'A03', 1, 2, 1, N'Available', 330000.00, N'0 0 0 0 0 0 8 40');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (88, 5, 24, N'A04', 1, 2, 2, N'Available', 330000.00, N'0 0 0 0 0 0 8 41');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (89, 5, 25, N'A05', 1, 3, 1, N'Available', 320000.00, N'0 0 0 0 0 0 8 42');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (90, 5, 26, N'A06', 1, 3, 2, N'Available', 320000.00, N'0 0 0 0 0 0 8 43');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (91, 5, 27, N'A07', 1, 4, 1, N'Available', 320000.00, N'0 0 0 0 0 0 8 44');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (92, 5, 28, N'A08', 1, 4, 2, N'Available', 320000.00, N'0 0 0 0 0 0 8 45');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (93, 5, 29, N'A09', 1, 5, 1, N'Available', 320000.00, N'0 0 0 0 0 0 8 46');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (94, 5, 30, N'A10', 1, 5, 2, N'Available', 320000.00, N'0 0 0 0 0 0 8 47');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (95, 5, 31, N'A11', 1, 6, 1, N'Available', 320000.00, N'0 0 0 0 0 0 8 48');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (96, 5, 32, N'A12', 1, 6, 2, N'Available', 320000.00, N'0 0 0 0 0 0 8 49');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (97, 5, 33, N'B01', 2, 1, 1, N'Available', 330000.00, N'0 0 0 0 0 0 8 50');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (98, 5, 34, N'B02', 2, 1, 2, N'Available', 330000.00, N'0 0 0 0 0 0 8 51');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (99, 5, 35, N'B03', 2, 2, 1, N'Available', 330000.00, N'0 0 0 0 0 0 8 52');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (100, 5, 36, N'B04', 2, 2, 2, N'Available', 330000.00, N'0 0 0 0 0 0 8 53');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (101, 5, 37, N'B05', 2, 3, 1, N'Available', 320000.00, N'0 0 0 0 0 0 8 54');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (102, 5, 38, N'B06', 2, 3, 2, N'Available', 320000.00, N'0 0 0 0 0 0 8 55');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (103, 5, 39, N'B07', 2, 4, 1, N'Available', 320000.00, N'0 0 0 0 0 0 8 56');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (104, 5, 40, N'B08', 2, 4, 2, N'Available', 320000.00, N'0 0 0 0 0 0 8 57');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (105, 5, 41, N'B09', 2, 5, 1, N'Available', 320000.00, N'0 0 0 0 0 0 8 58');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (106, 5, 42, N'B10', 2, 5, 2, N'Available', 320000.00, N'0 0 0 0 0 0 8 59');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (107, 5, 43, N'B11', 2, 6, 1, N'Available', 320000.00, N'0 0 0 0 0 0 8 60');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (108, 5, 44, N'B12', 2, 6, 2, N'Available', 320000.00, N'0 0 0 0 0 0 8 61');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (109, 6, 1, N'A01', 1, 1, 1, N'Available', 370000.00, N'0 0 0 0 0 0 8 62');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (110, 6, 2, N'A02', 1, 1, 2, N'Available', 370000.00, N'0 0 0 0 0 0 8 63');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (111, 6, 3, N'A03', 1, 2, 1, N'Available', 370000.00, N'0 0 0 0 0 0 8 64');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (112, 6, 4, N'A04', 1, 2, 2, N'Available', 370000.00, N'0 0 0 0 0 0 8 65');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (113, 6, 5, N'A05', 1, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 66');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (114, 6, 6, N'A06', 1, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 67');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (115, 6, 7, N'A07', 1, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 68');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (116, 6, 8, N'A08', 1, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 69');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (117, 6, 9, N'A09', 1, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 70');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (118, 6, 10, N'A10', 1, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 71');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (119, 6, 11, N'B01', 2, 1, 1, N'Available', 370000.00, N'0 0 0 0 0 0 8 72');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (120, 6, 12, N'B02', 2, 1, 2, N'Available', 370000.00, N'0 0 0 0 0 0 8 73');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (121, 6, 13, N'B03', 2, 2, 1, N'Available', 370000.00, N'0 0 0 0 0 0 8 74');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (122, 6, 14, N'B04', 2, 2, 2, N'Available', 370000.00, N'0 0 0 0 0 0 8 75');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (123, 6, 15, N'B05', 2, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 76');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (124, 6, 16, N'B06', 2, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 77');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (125, 6, 17, N'B07', 2, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 78');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (126, 6, 18, N'B08', 2, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 79');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (127, 6, 19, N'B09', 2, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 0 8 80');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (128, 6, 20, N'B10', 2, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 0 8 81');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (129, 7, 21, N'A01', 1, 1, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 20');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (130, 7, 22, N'A02', 1, 1, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 21');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (131, 7, 23, N'A03', 1, 2, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 22');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (132, 7, 24, N'A04', 1, 2, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 23');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (133, 7, 25, N'A05', 1, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 24');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (134, 7, 26, N'A06', 1, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 25');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (135, 7, 27, N'A07', 1, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 26');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (136, 7, 28, N'A08', 1, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 27');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (137, 7, 29, N'A09', 1, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 28');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (138, 7, 30, N'A10', 1, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 29');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (139, 7, 31, N'A11', 1, 6, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 30');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (140, 7, 32, N'A12', 1, 6, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 31');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (141, 7, 33, N'B01', 2, 1, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 32');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (142, 7, 34, N'B02', 2, 1, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 33');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (143, 7, 35, N'B03', 2, 2, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 34');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (144, 7, 36, N'B04', 2, 2, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 35');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (145, 7, 37, N'B05', 2, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 36');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (146, 7, 38, N'B06', 2, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 37');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (147, 7, 39, N'B07', 2, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 38');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (148, 7, 40, N'B08', 2, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 39');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (149, 7, 41, N'B09', 2, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 40');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (150, 7, 42, N'B10', 2, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 41');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (151, 7, 43, N'B11', 2, 6, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 42');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (152, 7, 44, N'B12', 2, 6, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 43');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (153, 8, 21, N'A01', 1, 1, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 44');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (154, 8, 22, N'A02', 1, 1, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 45');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (155, 8, 23, N'A03', 1, 2, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 46');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (156, 8, 24, N'A04', 1, 2, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 47');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (157, 8, 25, N'A05', 1, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 48');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (158, 8, 26, N'A06', 1, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 49');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (159, 8, 27, N'A07', 1, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 50');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (160, 8, 28, N'A08', 1, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 51');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (161, 8, 29, N'A09', 1, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 52');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (162, 8, 30, N'A10', 1, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 53');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (163, 8, 31, N'A11', 1, 6, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 54');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (164, 8, 32, N'A12', 1, 6, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 55');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (165, 8, 33, N'B01', 2, 1, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 56');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (166, 8, 34, N'B02', 2, 1, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 57');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (167, 8, 35, N'B03', 2, 2, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 58');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (168, 8, 36, N'B04', 2, 2, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 59');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (169, 8, 37, N'B05', 2, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 60');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (170, 8, 38, N'B06', 2, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 61');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (171, 8, 39, N'B07', 2, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 62');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (172, 8, 40, N'B08', 2, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 63');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (173, 8, 41, N'B09', 2, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 64');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (174, 8, 42, N'B10', 2, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 65');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (175, 8, 43, N'B11', 2, 6, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 66');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (176, 8, 44, N'B12', 2, 6, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 67');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (177, 9, 21, N'A01', 1, 1, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 68');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (178, 9, 22, N'A02', 1, 1, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 69');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (179, 9, 23, N'A03', 1, 2, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 70');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (180, 9, 24, N'A04', 1, 2, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 71');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (181, 9, 25, N'A05', 1, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 72');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (182, 9, 26, N'A06', 1, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 73');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (183, 9, 27, N'A07', 1, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 74');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (184, 9, 28, N'A08', 1, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 75');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (185, 9, 29, N'A09', 1, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 76');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (186, 9, 30, N'A10', 1, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 77');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (187, 9, 31, N'A11', 1, 6, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 78');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (188, 9, 32, N'A12', 1, 6, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 79');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (189, 9, 33, N'B01', 2, 1, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 80');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (190, 9, 34, N'B02', 2, 1, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 81');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (191, 9, 35, N'B03', 2, 2, 1, N'Available', 360000.00, N'0 0 0 0 0 1 33 82');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (192, 9, 36, N'B04', 2, 2, 2, N'Available', 360000.00, N'0 0 0 0 0 1 33 83');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (193, 9, 37, N'B05', 2, 3, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 84');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (194, 9, 38, N'B06', 2, 3, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 85');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (195, 9, 39, N'B07', 2, 4, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 86');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (196, 9, 40, N'B08', 2, 4, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 87');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (197, 9, 41, N'B09', 2, 5, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 88');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (198, 9, 42, N'B10', 2, 5, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 89');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (199, 9, 43, N'B11', 2, 6, 1, N'Available', 350000.00, N'0 0 0 0 0 1 33 90');
INSERT INTO [TripSeats] ([TripSeatId], [TripId], [BusSeatId], [SeatCode], [Deck], [Row], [Column], [SeatStatus], [CurrentPrice], [RowVersion]) VALUES (200, 9, 44, N'B12', 2, 6, 2, N'Available', 350000.00, N'0 0 0 0 0 1 33 91');
SET IDENTITY_INSERT [TripSeats] OFF;
GO

-- ==================== DATA FOR Promotions (4 rows) ====================
SET IDENTITY_INSERT [Promotions] ON;
INSERT INTO [Promotions] ([PromotionId], [Code], [Description], [DiscountType], [DiscountValue], [MaxDiscountAmount], [UsageLimit], [UsedCount], [ExpiresAt], [IsActive], [CreatedAt]) VALUES (1, N'FUTA50K', N'Giảm trực tiếp 50.000đ cho mọi tuyến xe Phương Trang / Thành Bưởi', N'Fixed', 50000.00, 50000.00, 500, 13, '2027-01-01 20:12:35.520', 1, '2026-11-02 20:12:35.520');
INSERT INTO [Promotions] ([PromotionId], [Code], [Description], [DiscountType], [DiscountValue], [MaxDiscountAmount], [UsageLimit], [UsedCount], [ExpiresAt], [IsActive], [CreatedAt]) VALUES (2, N'SINHVIEN30K', N'Ưu đãi Sinh viên giảm 30.000đ giá vé', N'Fixed', 30000.00, 30000.00, 300, 8, '2027-01-01 20:12:35.520', 1, '2026-11-02 20:12:35.520');
INSERT INTO [Promotions] ([PromotionId], [Code], [Description], [DiscountType], [DiscountValue], [MaxDiscountAmount], [UsageLimit], [UsedCount], [ExpiresAt], [IsActive], [CreatedAt]) VALUES (3, N'GIAM10', N'Giảm 10% tổng hóa đơn (Tối đa 60.000đ)', N'Percent', 10.00, 60000.00, 200, 5, '2026-12-17 20:12:35.520', 1, '2026-11-02 20:12:35.520');
INSERT INTO [Promotions] ([PromotionId], [Code], [Description], [DiscountType], [DiscountValue], [MaxDiscountAmount], [UsageLimit], [UsedCount], [ExpiresAt], [IsActive], [CreatedAt]) VALUES (4, N'VIP100K', N'Ưu đãi Hạng Vàng / Kim Cương giảm 100.000đ cho đơn khứ hồi hoặc nhóm', N'Fixed', 100000.00, 100000.00, 100, 2, '2027-01-31 20:12:35.520', 1, '2026-11-02 20:12:35.520');
SET IDENTITY_INSERT [Promotions] OFF;
GO

