﻿using PM.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PM.Application.Payloads.RequestModels.ProjectRequests
{
    public class Request_CreatePrintJob
    {
        public long DesignId { get; set; }
    }
}