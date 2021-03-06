#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 3 17:23:21 2019

@author: Jiayao Yang

"""
import numpy as np
import pandas as pd

###################### 数据来源  ######################

data1 = pd.read_csv('CrimeRate_Data.csv')
data1 = np.array(data1)

def get_each_record(data1):
    f1 = open('CrimeRateInsert.txt','w')
    f2 = open('Suburb.txt','w')

    for i in data1:
        #print(i[5].replace("\'","\''"))
        print("INSERT INTO [dbo].[{}](SuburbSuburbName, Rate, OffenceCount, Totpopulation) VALUES ('{}','{}','{}','{}');".format('CrimeRate',i[0],i[4],i[2],i[3]),file = f1)
        print("INSERT INTO [dbo].[{}](SuburbName,Postcode, Boundary1,Boundary2) VALUES ('{}','{}','{}','{}');".format('Suburb',i[0],i[1],i[5][0:len(i[5])//2].replace("\'","\''"),i[5][len(i[5])//2:].replace("\'","\''")),file = f2)
    f1.close()
    f2.close()


output = get_each_record(data1)
