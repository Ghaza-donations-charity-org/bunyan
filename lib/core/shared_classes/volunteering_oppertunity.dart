class VolunteeringOppertunity {
  String _title;
  String _description;
  String _state;
  String _refugeeId;
  String _volunteeringOpportunityId;

  // Constructor
  VolunteeringOppertunity({
    required String title,
    required String description,
    required String state,
    required String refugeeId,
    required String volunteeringOpportunityId,
  })  : _title = title,
        _description = description,
        _state = state,
        _refugeeId = refugeeId,
        _volunteeringOpportunityId = volunteeringOpportunityId;

  // Getters
  String get title => _title;
  String get description => _description;
  String get state => _state;
  String get refugeeId => _refugeeId;
  String get volunteeringOpportunityId => _volunteeringOpportunityId;

  // Setters
  set title(String title) => _title = title;
  set description(String description) => _description = description;
  set state(String state) => _state = state;
  set refugeeId(String refugeeId) => _refugeeId = refugeeId;
  set volunteeringOpportunityId(String volunteeringOpportunityId) =>
      _volunteeringOpportunityId = volunteeringOpportunityId;

  // Method to check if the opportunity is active
  bool isActive() {
    return _state.toLowerCase() == 'active';
  }

  // Method to provide a string representation of the opportunity
  @override
  String toString() {
    return 'Opportunity(title: $_title, description: $_description, state: $_state, refugeeId: $_refugeeId, volunteeringOpportunityId: $_volunteeringOpportunityId)';
  }
}


//Commit msg
// renamed to volunteering_oppertunity
// added description, state, title, refugee_id, volunteering_oppurtiunity_id as attributes
// added getters and setters for attributes
