

ml_load_tf <- function(mdl_dir, input_mapping, output_mapping, ...){
  im <- invoke_static(sc,"sparktf.StringUtils","StringToMap",input_mapping)
  om <- invoke_static(sc,"sparktf.StringUtils","StringToMap",output_mapping)
  
  
  sparklyr::invoke_new(sc,"com.yahoo.tensorflowonspark.TFModel") %>%
    sparklyr::invoke(method="setModel",mdl_dir) %>%
    sparklyr::invoke(method="setInputMapping",im) %>%
    sparklyr::invoke(method="setOutputMapping",om)
}



ml_predict_tf <- function(x , dataset, ...){
  sparklyr::invoke(x, method = "transform", dataset)
}
