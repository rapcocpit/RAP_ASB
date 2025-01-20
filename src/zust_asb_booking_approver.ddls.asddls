@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project view for Booking processor'
--@Metadata.ignorePropagatedAnnotations: true 
@Metadata.allowExtensions: true
define view entity ZUST_ASB_BOOKING_APPROVER as projection on Zi_ust_asb_booking
{
    key TravelId,
    key BookingId,
    BookingDate,
//    @Consumption.valueHelpDefinition: [{ 
//        entity.name: '/DMO/I_Customer', 
//        entity.element: 'CustomerID'
//     }]
    CustomerId,
//    @Consumption.valueHelpDefinition: [{ 
//        entity.name: '/DMO/I_Carrier',
//        entity.element: 'AirlineID'
//     }]
//    @ObjectModel.text.element: [ 'AirlineName' ]
    CarrierId,
//    @Consumption.valueHelpDefinition: [{ 
//        entity.name: '/DMO/I_Connection',
//        entity.element: 'ConnectionID',
//        additionalBinding: [{ element: 'AirlineID', localElement: 'CarrierId', usage: #FILTER_AND_RESULT }]
//     }]
    ConnectionId,
//    @Consumption.valueHelpDefinition: [{ 
//        entity.name: '/DMO/I_Flight',
//        entity.element: 'FlightDate',
//        additionalBinding: [{ element: 'CarrierID', localElement: 'CarrierId', usage: #FILTER_AND_RESULT },
//                            { element: 'ConnectionID', localElement: 'ConnectionId', usage: #FILTER_AND_RESULT }]
//     }]
    FlightDate,
    FlightPrice,
//    @Consumption.valueHelpDefinition: [{ 
//        entity.name: 'I_CurrencyStdVH',
//        entity.element: 'Currency'
//     }]
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    @Semantics.text: true
    _Carrier.Name as AirlineName,
    /* Associations */
    _BookingStatus,
    _BookingSupplement: redirected to composition child ZUST_ASB_BSUPPL_approver,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZUST_ASB_TRAVEL_Approver
}

