using RiskService as service from '../../srv/risk-service';
//risk List Page
annotate RiskService.Risks with @(UI : {  
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Risk',
        TypeNamePlural : 'Risks',
        Title: {
            Value : title,
            $Type : 'UI.DataField'
        },
        Description : {
            Value : descr,
            $Type : 'UI.DataField',
        }

    },
    SelectionFields  : [
        prio
    ],
//    Identification : [{Value : title}],
    LineItem  : [
        {Value : title},
        {Value: owner},
        {Value: miti_ID},
        {Value: bp_BusinessPartner},
        {
            Value: prio,
            Criticality : criticality,
        },
        {
            Value: impact,
            Criticality: criticality
        }
    ],
    Facets  : [
        {$Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target : '@UI.FieldGroup#Main',}
    ],
    FieldGroup #Main : {
        Data : [
            {Value : title},
            {Value: owner},
            {Value: miti_ID},
            {Value: bp_BusinessPartner},
            {
                Value: prio,
                Criticality : criticality,
            },
            {
                Value: impact,
                Criticality: criticality
            }
        ]
        
    },
});
annotate service.Risks with {
    miti @Common.Text : {
            $value : miti.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Risks with {
    bp @Common.Text : {
            $value : bp.LastName,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
