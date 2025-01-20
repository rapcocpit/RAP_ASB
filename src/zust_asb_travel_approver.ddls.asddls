@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project view for travel processor'
--@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZUST_ASB_TRAVEL_Approver as projection on Zi_ust_asb_travel
{

    @ObjectModel.text.element: [ 'Description' ]
    key TravelId,
    @ObjectModel.text.element: [ 'AgencyName' ]
    AgencyId,
    @Semantics.text: true
    _Agency.Name as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    CustomerId,
    @Semantics.text: true
    _Customer.FirstName as CustomerName,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    @Semantics.text: true
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    StatusText,
    Criticality,
    /* Associations */
    _Agency,
    _Booking: redirected to composition child ZUST_ASB_BOOKING_APPROVER,
    _Currency,
    _Customer,
    _OverallStatus
//    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_UST_ASB_VE_CALC'
//    @EndUserText.label: 'CO2 Tax'
//    virtual CO2Tax : abap.int4,
//    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_UST_ASB_VE_CALC'
//    @EndUserText.label: 'Week Day'
//    virtual dayOfTheFlight : abap.char( 9 )



}
