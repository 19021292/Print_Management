﻿using PM.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PM.Application.Payloads.ResponseModels.DataProjects
{
    public class DataResponseResourcePropertyDetail : DataResponseBase
    {
        public long PropertyId { get; set; }
        public string PropertyDetailName { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
    }
}
