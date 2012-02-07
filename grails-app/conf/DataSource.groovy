dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://localhost:5432/reqmanager"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
        }
    }
    production {
      dataSource {
        dbCreate = "update"
          driverClassName = "org.postgresql.Driver"
          dialect = org.hibernate.dialect.PostgreSQLDialect

          uri = new URI(System.env.DATABASE_URL?:"postgres://test:test@localhost/test")

          url = "jdbc:postgresql://"+uri.host+uri.path
          username = uri.userInfo.split(":")[0]
          password = uri.userInfo.split(":")[1]
      }
    }
}
