
Feature: [SF-MAS-2CD-INC] Multi Active Satellites


 @fixture.multi_active_satellite
  Scenario: [SF-MAS-2CD-INC-01] Load empty stage into a non existent multi-active satellite - one cycle
    Given the MULTI_ACTIVE_SATELLITE_TWO_CDK table does not exist
    And the RAW_STAGE table contains data
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | LOAD_DATE  | SOURCE |
      | 1001        | Alice         | 17-214-233-1214 | 12301     | 1993-01-01 | *      |
      | 1001        | Alice         | 17-214-233-1214 | 12302     | 1993-01-01 | *      |
      | 1001        | Alice         | 17-214-233-1214 | 12303     | 1993-01-01 | *      |
      | 1001        | Alice         | 17-214-233-1214 | 12303     | 1993-01-01 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12311     | 1993-01-01 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12312     | 1993-01-01 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12313     | 1993-01-01 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12313     | 1993-01-01 | *      |
      | 1003        | Chad          | 17-214-233-1216 | 12321     | 1993-01-01 | *      |
      | 1003        | Chad          | 17-214-233-1226 | 12321     | 1993-01-01 | *      |
      | 1003        | Chad          | 17-214-233-1226 | 12321     | 1993-01-01 | *      |
      | 1003        | Chad          | 17-214-233-1236 | 12321     | 1993-01-01 | *      |
      | 1005        | Eric          | 17-214-233-1217 | 12331     | 1993-01-01 | *      |
      | 1005        | Eric          | 17-214-233-1227 | 12331     | 1993-01-01 | *      |
      | 1005        | Eric          | 17-214-233-1237 | 12331     | 1993-01-01 | *      |
      | 1005        | Eric          | 17-214-233-1237 | 12331     | 1993-01-01 | *      |
    And I stage the STG_CUSTOMER_TWO_CDK data
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat
    And the RAW_STAGE table contains data
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | LOAD_DATE  | SOURCE |
    Then the MULTI_ACTIVE_SATELLITE_TWO_CDK table should contain expected data
      | CUSTOMER_PK | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | HASHDIFF                                         | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | md5('1001') | Alice         | 17-214-233-1214 | 12301     | md5('1001\|\|ALICE\|\|17-214-233-1214\|\|12301') | 1993-01-01     | 1993-01-01 | *      |
      | md5('1001') | Alice         | 17-214-233-1214 | 12302     | md5('1001\|\|ALICE\|\|17-214-233-1214\|\|12302') | 1993-01-01     | 1993-01-01 | *      |
      | md5('1001') | Alice         | 17-214-233-1214 | 12303     | md5('1001\|\|ALICE\|\|17-214-233-1214\|\|12303') | 1993-01-01     | 1993-01-01 | *      |
      | md5('1002') | Bob           | 17-214-233-1215 | 12311     | md5('1002\|\|BOB\|\|17-214-233-1215\|\|12311')   | 1993-01-01     | 1993-01-01 | *      |
      | md5('1002') | Bob           | 17-214-233-1215 | 12312     | md5('1002\|\|BOB\|\|17-214-233-1215\|\|12312')   | 1993-01-01     | 1993-01-01 | *      |
      | md5('1002') | Bob           | 17-214-233-1215 | 12313     | md5('1002\|\|BOB\|\|17-214-233-1215\|\|12313')   | 1993-01-01     | 1993-01-01 | *      |
      | md5('1003') | Chad          | 17-214-233-1216 | 12321     | md5('1003\|\|CHAD\|\|17-214-233-1216\|\|12321')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1003') | Chad          | 17-214-233-1226 | 12321     | md5('1003\|\|CHAD\|\|17-214-233-1226\|\|12321')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1003') | Chad          | 17-214-233-1236 | 12321     | md5('1003\|\|CHAD\|\|17-214-233-1236\|\|12321')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1005') | Eric          | 17-214-233-1217 | 12331     | md5('1005\|\|ERIC\|\|17-214-233-1217\|\|12331')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1005') | Eric          | 17-214-233-1227 | 12331     | md5('1005\|\|ERIC\|\|17-214-233-1227\|\|12331')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1005') | Eric          | 17-214-233-1237 | 12331     | md5('1005\|\|ERIC\|\|17-214-233-1237\|\|12331')  | 1993-01-01     | 1993-01-01 | *      |

  @fixture.multi_active_satellite
  Scenario: [SF-MAS-2CD-INC-02] Load stage into a non existent multi-active satellite - one cycle
    Given the MULTI_ACTIVE_SATELLITE_TWO_CDK table does not exist
    And the RAW_STAGE table contains data
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | LOAD_DATE  | SOURCE |
      | 1001        | Alice         | 17-214-233-1214 | 12301     | 1993-01-01 | *      |
      | 1001        | Alice         | 17-214-233-1214 | 12302     | 1993-01-01 | *      |
      | 1001        | Alice         | 17-214-233-1214 | 12303     | 1993-01-01 | *      |
      | 1001        | Alice         | 17-214-233-1214 | 12303     | 1993-01-01 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12311     | 1993-01-01 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12312     | 1993-01-01 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12313     | 1993-01-01 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12313     | 1993-01-01 | *      |
      | 1003        | Chad          | 17-214-233-1216 | 12321     | 1993-01-01 | *      |
      | 1003        | Chad          | 17-214-233-1226 | 12321     | 1993-01-01 | *      |
      | 1003        | Chad          | 17-214-233-1226 | 12321     | 1993-01-01 | *      |
      | 1003        | Chad          | 17-214-233-1236 | 12321     | 1993-01-01 | *      |
      | 1005        | Eric          | 17-214-233-1217 | 12331     | 1993-01-01 | *      |
      | 1005        | Eric          | 17-214-233-1227 | 12331     | 1993-01-01 | *      |
      | 1005        | Eric          | 17-214-233-1237 | 12331     | 1993-01-01 | *      |
      | 1005        | Eric          | 17-214-233-1237 | 12331     | 1993-01-01 | *      |
    And I stage the STG_CUSTOMER_TWO_CDK data
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat
    And the RAW_STAGE table contains data
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | LOAD_DATE  | SOURCE |
      | 1001        | Alice         | 17-214-233-1214 | 12301     | 1993-01-02 | *      |
      | 1001        | Alice         | 17-214-233-1214 | 12302     | 1993-01-02 | *      |
      | 1001        | Alice         | 17-214-233-1214 | 12303     | 1993-01-02 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12311     | 1993-01-02 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12312     | 1993-01-02 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12314     | 1993-01-02 | *      |
      | 1002        | Bob           | 17-214-233-1215 | 12314     | 1993-01-02 | *      |
      | 1003        | Chad          | 17-214-233-1216 | 12321     | 1993-01-02 | *      |
      | 1003        | Chad          | 17-214-233-1226 | 12321     | 1993-01-02 | *      |
      | 1006        | Dan           | 17-214-233-1230 | 12430     | 1993-01-02 | *      |
      | 1006        | Dan           | 17-214-233-1230 | 12440     | 1993-01-02 | *      |
      | 1006        | Dan           | 17-214-233-1240 | 12440     | 1993-01-02 | *      |

    Then the MULTI_ACTIVE_SATELLITE_TWO_CDK table should contain expected data
      | CUSTOMER_PK | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | HASHDIFF                                         | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | md5('1001') | Alice         | 17-214-233-1214 | 12301     | md5('1001\|\|ALICE\|\|17-214-233-1214\|\|12301') | 1993-01-01     | 1993-01-01 | *      |
      | md5('1001') | Alice         | 17-214-233-1214 | 12302     | md5('1001\|\|ALICE\|\|17-214-233-1214\|\|12302') | 1993-01-01     | 1993-01-01 | *      |
      | md5('1001') | Alice         | 17-214-233-1214 | 12303     | md5('1001\|\|ALICE\|\|17-214-233-1214\|\|12303') | 1993-01-01     | 1993-01-01 | *      |
      | md5('1002') | Bob           | 17-214-233-1215 | 12311     | md5('1002\|\|BOB\|\|17-214-233-1215\|\|12311')   | 1993-01-01     | 1993-01-01 | *      |
      | md5('1002') | Bob           | 17-214-233-1215 | 12312     | md5('1002\|\|BOB\|\|17-214-233-1215\|\|12312')   | 1993-01-01     | 1993-01-01 | *      |
      | md5('1002') | Bob           | 17-214-233-1215 | 12313     | md5('1002\|\|BOB\|\|17-214-233-1215\|\|12313')   | 1993-01-01     | 1993-01-01 | *      |
      | md5('1002') | Bob           | 17-214-233-1215 | 12311     | md5('1002\|\|BOB\|\|17-214-233-1215\|\|12311')   | 1993-01-02     | 1993-01-02 | *      |
      | md5('1002') | Bob           | 17-214-233-1215 | 12312     | md5('1002\|\|BOB\|\|17-214-233-1215\|\|12312')   | 1993-01-02     | 1993-01-02 | *      |
      | md5('1002') | Bob           | 17-214-233-1215 | 12314     | md5('1002\|\|BOB\|\|17-214-233-1215\|\|12313')   | 1993-01-02     | 1993-01-02 | *      |
      | md5('1003') | Chad          | 17-214-233-1216 | 12321     | md5('1003\|\|CHAD\|\|17-214-233-1216\|\|12321')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1003') | Chad          | 17-214-233-1226 | 12321     | md5('1003\|\|CHAD\|\|17-214-233-1226\|\|12321')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1003') | Chad          | 17-214-233-1236 | 12321     | md5('1003\|\|CHAD\|\|17-214-233-1236\|\|12321')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1003') | Chad          | 17-214-233-1216 | 12321     | md5('1003\|\|CHAD\|\|17-214-233-1216\|\|12321')  | 1993-01-02     | 1993-01-02 | *      |
      | md5('1003') | Chad          | 17-214-233-1226 | 12321     | md5('1003\|\|CHAD\|\|17-214-233-1226\|\|12321')  | 1993-01-02     | 1993-01-02 | *      |
      | md5('1005') | Eric          | 17-214-233-1217 | 12331     | md5('1005\|\|ERIC\|\|17-214-233-1217\|\|12331')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1005') | Eric          | 17-214-233-1227 | 12331     | md5('1005\|\|ERIC\|\|17-214-233-1227\|\|12331')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1005') | Eric          | 17-214-233-1237 | 12331     | md5('1005\|\|ERIC\|\|17-214-233-1237\|\|12331')  | 1993-01-01     | 1993-01-01 | *      |
      | md5('1006') | Dan           | 17-214-233-1230 | 12430     | md5('1006\|\|DAN\|\|17-214-233-1230\|\|12430')   | 1993-01-02     | 1993-01-02 | *      |
      | md5('1006') | Dan           | 17-214-233-1230 | 12440     | md5('1006\|\|DAN\|\|17-214-233-1230\|\|12440')   | 1993-01-02     | 1993-01-02 | *      |
      | md5('1006') | Dan           | 17-214-233-1240 | 12440     | md5('1006\|\|DAN\|\|17-214-233-1230\|\|12440')   | 1993-01-02     | 1993-01-02 | *      |
