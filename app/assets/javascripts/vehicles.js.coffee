jQuery ->
  # load models when manufacturer is selected
  handleModelSelect = (manufacturerSelect) ->
    modelsSelect = $("#vehicle_model_id")
    possibleModels = modelsSelect.data("possible-models")
    modelsOptions = "<option value></option>"

    if possibleModels.length > 0
      for model in possibleModels when model.manufacturer_id is manufacturerSelect.val()
        modelsOptions = "#{modelsOptions}<option value='#{model.id}'>#{model.name}</option>"
        
    modelsSelect.html(modelsOptions)
    .attr("disabled", $(manufacturerSelect).val() is "")
    .change()

  
  manufacturerSelect = $("#vehicle_model_attributes_manufacturer_id")

  if manufacturerSelect.length > 0
    handleModelSelect manufacturerSelect

    # select vehicle saved model
    selected = $("#vehicle_model_id").data("selected")
    $("#vehicle_model_id").val(selected) if selected isnt ""

    manufacturerSelect.change ->
      handleModelSelect manufacturerSelect

