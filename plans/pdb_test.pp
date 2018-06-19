plan pdb_test {
  return(puppetdb_query("nodes[certname] {}"))
}
