using { sap.capire.incidents as my } from '../db/schema';

/**
 * Service used by support personel, i.e. the incident's 'processors'
 */

service ProcessorService {
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers
} 

annotate ProcessorService.Incidents with @odata.draft.enabled;
annotate ProcessorService with @(requires: 'support');

/**
 * Service used by adminsitrators to manage customers and incidents
 */

service AdminService {
    entity Customers as projection on my.Customers;
    entity Incidents as projection on my.Incidents;
} 

annotate AdminService with @(requires: 'admin');