

#'@ example ml_load_tf(mdl_dir = '~/mdl/train', input_mapping = '{"image": "inputs/x", "label": "inputs/y_"}', output_mapping = '{"prediction": "prediction", "layer/hidden_layer/Relu": "features"}')
#'
ml_load_tf <- function(mdl_dir, input_mapping, output_mapping, ...){
  im <- invoke_static(sc,"sparktf.StringUtils","StringToMap",input_mapping)
  om <- invoke_static(sc,"sparktf.StringUtils","StringToMap",output_mapping)
 
  sparklyr::invoke_new(sc,"com.yahoo.tensorflowonspark.TFModel") %>%
    sparklyr::invoke(method="setModel",mdl_dir) %>%
    sparklyr::invoke(method="setInputMapping",im) %>%
    sparklyr::invoke(method="setOutputMapping",om)
}

#'@ example res_df <- ml_predict_tf(x = mdl, dataset = df)
#'
ml_predict_tf <- function(x , dataset, ...){
  sparklyr::invoke(x, method = "transform", dataset)
}
