@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'view entity for attachment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZUST_ASB_U_Attachment as select from zust_asb__attach
association to parent Zi_ust_asb_travel as _travel 
//composition[0..*] of Zi_ust_asb_travel as _travel
on $projection.TravelId = _travel.TravelId
{
    key travel_id as TravelId,
    @EndUserText.label: 'Attchment ID '
    key id as Id,
    @EndUserText.label: 'Comments'
    memo as Memo,
    @Semantics.largeObject: {
        mimeType: 'Filetype',
        fileName: 'Filename',
        acceptableMimeTypes: [ 'APPLICATION/PDF' ],
        contentDispositionPreference: #INLINE        
    }
    @EndUserText.label: 'Attchment'
    attachment as Attachment,
    @EndUserText.label: 'Filename '
    filename as Filename,
    @EndUserText.label: 'Filetype'
    @Semantics.mimeType: true
    filetype as Filetype,
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_at as LastChangedAt,
//    Assocation 
    _travel
}
