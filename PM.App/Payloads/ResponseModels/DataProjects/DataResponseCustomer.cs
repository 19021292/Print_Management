﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PM.Application.Payloads.ResponseModels.DataProjects
{
    public class DataResponseCustomer : DataResponseBase
    {
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public long Id { get; set; }

    }
}
