

ml_load_tf <- function(mdl_dir, input_mapping, output_mapping, ...){
  sparklyr::invoke_new(sc,"com.yahoo.tensorflowonspark.TFModel") %>%
    sparklyr::invoke(method="setModel",mdl_dir) %>%
    sparklyr::invoke(method="setInputMapping",input_mapping) %>%
    sparklyr::invoke(method="setOutputMapping",output_mapping)
}



ml_predict_tf <- function(x , dataset, ...){
  sparklyr::invoke(x, method = "transform", dataset)
}
