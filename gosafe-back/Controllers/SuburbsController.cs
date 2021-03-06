﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using gosafe_back.Results;
using System.Threading.Tasks;
using gosafe_back.Models;
using Newtonsoft.Json;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace gosafe_back.Controllers
{
    [RoutePrefix("api/Suburbs")]
    public class SuburbsController : ApiController
    {
        private Model1Container db = new Model1Container();

        // POST: api/Suburbs/Index
        [Route("Index")]
        public IHttpActionResult Index()
        {
            var suburb = db.Suburb.Count();
            return Ok(suburb);
        }

        // POST: api/Suburbs/Details
        // Retrieve the suburb and crime rate details.
        [Route("Details")]
        [AllowAnonymous]
        public IHttpActionResult Details(List<String> suburbs)
        {
            System.Diagnostics.Debug.WriteLine("debug:");
            System.Diagnostics.Debug.WriteLine(suburbs);
            if (suburbs != null)
            {
                //find suburbs
                List<SuburbCrime> SuburbCrimeList = new List<SuburbCrime>();
                foreach (var i in suburbs)
                {
                    Suburb theSuburb = db.Suburb.Find(i);
                    CrimeRate theRate = db.CrimeRate.Find(i);
                    if (theSuburb != null && theRate!=null)
                    {
                        var newSub = new SuburbCrime();
                        newSub.suburbname = i;
                        newSub.boundary = theSuburb.Boundary1 + theSuburb.Boundary2;
                        newSub.crimeRate = theRate.Rate;
                        SuburbCrimeList.Add(newSub);
                    }
                        
                    
                }

                String json = JsonConvert.SerializeObject(SuburbCrimeList);

                //output Json type suburb details to front-end
                return Json(json);
            }
            else
            {
                return Json("failed");
            }
            //Suburb suburb = db.Suburb.Find(id);

        }

        //Send a message to the user's emergency contact through twillo.
        [Route("Message")]
        [Authorize]
        public IHttpActionResult Message(List<String> message)
        {
            string accountSid = "AC74cbd14cfcc9ba2223860c576ea50426";
            string authToken = "e92d1e11608304fa746c5b3c58fbeb29";
            System.Diagnostics.Debug.WriteLine("debug:");
            System.Diagnostics.Debug.WriteLine(message);
            if (message != null)
            {
                TwilioClient.Init(accountSid, authToken);

                var content = MessageResource.Create(
                    body: message[1],
                    from: new Twilio.Types.PhoneNumber("+61488850878"),
                    to: new Twilio.Types.PhoneNumber(message[0])
                );

                Console.WriteLine(content.Sid);


                return Json(content.Sid);
            }
            else
            {
                return Json("failed");
            }
            //Suburb suburb = db.Suburb.Find(id);

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
