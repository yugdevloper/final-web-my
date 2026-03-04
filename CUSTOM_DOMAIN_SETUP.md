# Custom Domain Setup Guide 🌐

## Aapke Paas Domain Hai - Perfect! 🎉

Custom domain setup karna bahut easy hai. Main step-by-step batata hoon.

---

## 🚀 Complete Process (15 Minutes):

### Part 1: Website Deploy Karo (5 min)
### Part 2: Domain Connect Karo (5 min)
### Part 3: DNS Propagation Wait Karo (24-48 hours)

---

## Part 1: Vercel Par Deploy Karo

### Step 1: Vercel Account
1. https://vercel.com par jao
2. GitHub se sign up karo

### Step 2: Project Deploy
1. "Add New" → "Project"
2. GitHub repository import karo
3. Settings:
   - Framework: **Vite**
   - Root Directory: **frontend**
   - Build Command: **npm run build**
   - Output Directory: **dist**

4. Environment Variables add karo (Firebase config)
5. "Deploy" click karo
6. Wait 2-3 minutes
7. Temporary URL milega: `your-project.vercel.app`

---

## Part 2: Custom Domain Connect Karo

### Vercel Dashboard Mein:

#### Step 1: Domain Settings
1. Deployed project kholo
2. "Settings" tab par jao
3. "Domains" section select karo
4. "Add" button click karo

#### Step 2: Domain Enter Karo
1. Apna domain enter karo (e.g., `upexammantra.com`)
2. "Add" click karo
3. Vercel 3 options dega:
   - **Option A**: Nameservers change karo (Recommended)
   - **Option B**: A Record add karo
   - **Option C**: CNAME add karo

---

## 🎯 Best Method: Nameservers (Recommended)

### Kyon Best Hai?
- ✅ Sabse easy
- ✅ Automatic SSL
- ✅ Automatic configuration
- ✅ Best performance
- ✅ No manual DNS records

### Steps:

#### 1. Vercel Se Nameservers Copy Karo
Vercel aapko 2 nameservers dega:
```
ns1.vercel-dns.com
ns2.vercel-dns.com
```

#### 2. Domain Provider Par Jao

**GoDaddy:**
1. https://godaddy.com par login karo
2. "My Products" → Domains
3. Apna domain select karo
4. "Manage DNS" click karo
5. "Nameservers" section mein jao
6. "Change" click karo
7. "Custom" select karo
8. Vercel ke nameservers paste karo:
   - `ns1.vercel-dns.com`
   - `ns2.vercel-dns.com`
9. "Save" click karo

**Namecheap:**
1. https://namecheap.com par login karo
2. "Domain List" → Manage
3. "Nameservers" section
4. "Custom DNS" select karo
5. Vercel nameservers add karo
6. Save karo

**Hostinger:**
1. https://hostinger.com par login karo
2. Domains → Manage
3. DNS / Nameservers
4. Custom nameservers add karo
5. Save karo

**BigRock:**
1. https://bigrock.in par login karo
2. Domain Management
3. Nameservers
4. Custom nameservers set karo
5. Save karo

#### 3. Wait Karo
- DNS propagation: 24-48 hours
- Usually 2-6 hours mein ho jata hai
- Check karo: https://dnschecker.org

#### 4. Done!
- Vercel automatically SSL certificate add kar dega
- HTTPS automatic enable hoga
- `www` subdomain bhi automatic work karega

---

## 🔧 Alternative Method: A Record (Manual)

Agar nameservers change nahi kar sakte, to A Record use karo:

### Step 1: Vercel IP Address
Vercel dashboard mein domain settings se IP address copy karo:
```
76.76.21.21
```

### Step 2: DNS Settings Mein Jao

**Add These Records:**

#### A Record (Main Domain):
```
Type: A
Name: @
Value: 76.76.21.21
TTL: Automatic (or 3600)
```

#### CNAME Record (www):
```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: Automatic (or 3600)
```

### Step 3: Save & Wait
- Save karo
- 24-48 hours wait karo
- Check karo: https://dnschecker.org

---

## 📱 Subdomain Setup (Optional)

Agar aap subdomain bhi use karna chahte ho:

### Examples:
- `app.upexammantra.com` - Main app
- `admin.upexammantra.com` - Admin panel
- `blog.upexammantra.com` - Blog

### Setup:

#### Vercel Dashboard:
1. Settings → Domains
2. "Add" click karo
3. Subdomain enter karo: `app.upexammantra.com`
4. Add karo

#### DNS Settings:
```
Type: CNAME
Name: app
Value: cname.vercel-dns.com
TTL: Automatic
```

---

## 🔒 SSL Certificate (Automatic)

### Vercel Automatic SSL Deta Hai:
- ✅ Free SSL certificate
- ✅ Auto-renewal
- ✅ HTTPS forced
- ✅ No configuration needed

### Check SSL:
1. Domain open karo browser mein
2. URL bar mein 🔒 lock icon dikhna chahiye
3. Certificate valid hona chahiye

---

## ✅ Verification Checklist:

### After DNS Setup:

- [ ] Domain open ho raha hai?
- [ ] HTTPS working hai?
- [ ] www redirect working hai?
- [ ] Mobile par test kiya?
- [ ] Different browsers mein test kiya?
- [ ] SSL certificate valid hai?

### Test Tools:
- **DNS Check**: https://dnschecker.org
- **SSL Check**: https://www.ssllabs.com/ssltest/
- **Speed Test**: https://pagespeed.web.dev

---

## 🌐 Firebase Authorized Domain

### Important Step:

1. **Firebase Console** kholo: https://console.firebase.google.com
2. Apna project select karo
3. **Authentication** → **Settings**
4. **Authorized domains** section mein jao
5. "Add domain" click karo
6. Apna domain add karo:
   - `upexammantra.com`
   - `www.upexammantra.com`
7. Save karo

**Ye bahut important hai!** Nahi to login/signup work nahi karega.

---

## 📧 Email Setup (Optional)

Agar professional email chahiye:

### Option 1: Google Workspace (Paid)
- `admin@upexammantra.com`
- `support@upexammantra.com`
- Cost: ₹125/month per user

### Option 2: Zoho Mail (Free)
- Free for 5 users
- Professional email
- Setup: https://zoho.com/mail

### Option 3: Domain Forwarding (Free)
- Forward to Gmail
- Domain provider settings mein setup karo

---

## 🎨 Branding Update

### After Domain Setup:

#### 1. Update Social Links
- Telegram channel description
- YouTube channel description
- Social media profiles

#### 2. Google Search Console
1. https://search.google.com/search-console
2. Add property: `upexammantra.com`
3. Verify ownership
4. Submit sitemap

#### 3. Google Analytics (Optional)
1. https://analytics.google.com
2. Create property
3. Add tracking code
4. Monitor traffic

---

## 🚀 Performance Optimization

### After Domain Live:

#### 1. CDN (Automatic with Vercel)
- Global CDN
- Fast loading worldwide
- Automatic optimization

#### 2. Caching
- Browser caching enabled
- Static assets cached
- Fast repeat visits

#### 3. Compression
- Gzip/Brotli enabled
- Smaller file sizes
- Faster loading

---

## 📊 Monitoring

### Track Your Website:

#### 1. Vercel Analytics (Free)
- Real-time visitors
- Page views
- Performance metrics
- Automatic setup

#### 2. Google Analytics (Free)
- Detailed analytics
- User behavior
- Traffic sources
- Conversion tracking

#### 3. Uptime Monitoring (Free)
- **UptimeRobot**: https://uptimerobot.com
- **Pingdom**: https://pingdom.com
- Get alerts if site goes down

---

## 🆘 Troubleshooting

### Domain Not Working?

#### Check 1: DNS Propagation
```bash
# Windows
nslookup upexammantra.com

# Mac/Linux
dig upexammantra.com
```

#### Check 2: Nameservers
- Domain provider mein check karo
- Correct nameservers set hain?

#### Check 3: Vercel Dashboard
- Domain status "Active" hai?
- SSL certificate issued hai?

### Common Issues:

**Issue**: "Domain not found"
- **Solution**: DNS propagation wait karo (24-48 hours)

**Issue**: "SSL certificate error"
- **Solution**: Vercel dashboard mein "Renew certificate" click karo

**Issue**: "Firebase auth error"
- **Solution**: Authorized domains mein domain add karo

**Issue**: "www not working"
- **Solution**: CNAME record check karo

---

## 📝 Quick Reference

### Your Domain Setup:

```
Domain: upexammantra.com (example)
Hosting: Vercel
SSL: Automatic (Free)
CDN: Global (Automatic)
Email: Setup separately (optional)
```

### DNS Records (If using A Record method):

```
A Record:
  Name: @
  Value: 76.76.21.21
  
CNAME Record:
  Name: www
  Value: cname.vercel-dns.com
```

### Vercel Nameservers (If using Nameserver method):

```
ns1.vercel-dns.com
ns2.vercel-dns.com
```

---

## 🎉 Final Steps

### After Domain is Live:

1. **Test Everything**:
   - [ ] Homepage loads
   - [ ] Registration works
   - [ ] Login works
   - [ ] Admin panel works
   - [ ] Tests work
   - [ ] Mobile responsive
   - [ ] SSL working

2. **Update Links**:
   - [ ] Telegram channel
   - [ ] YouTube channel
   - [ ] Social media
   - [ ] Business cards

3. **Marketing**:
   - [ ] Announce on social media
   - [ ] Share with students
   - [ ] Create promotional content
   - [ ] Start SEO

4. **Monitor**:
   - [ ] Setup analytics
   - [ ] Setup uptime monitoring
   - [ ] Check performance
   - [ ] Track user feedback

---

## 💡 Pro Tips

### 1. Use www Redirect
- Main domain: `upexammantra.com`
- Redirect: `www.upexammantra.com` → `upexammantra.com`
- Vercel automatically handles this

### 2. Enable HSTS
- Vercel automatically enables
- Forces HTTPS
- Better security

### 3. Preload Domain
- Submit to HSTS preload list
- https://hstspreload.org
- Maximum security

### 4. Setup Email
- Professional email looks better
- `admin@upexammantra.com`
- Builds trust

---

## 📞 Support

### Need Help?

**Vercel Support**:
- Docs: https://vercel.com/docs
- Support: https://vercel.com/support

**Domain Provider Support**:
- GoDaddy: https://godaddy.com/help
- Namecheap: https://namecheap.com/support
- Hostinger: https://hostinger.com/support

**DNS Tools**:
- Check propagation: https://dnschecker.org
- Check SSL: https://ssllabs.com/ssltest
- Check speed: https://pagespeed.web.dev

---

## ✅ Complete Checklist

### Pre-Deployment:
- [x] Website code ready
- [x] Firebase setup done
- [x] Environment variables ready
- [x] Domain purchased

### Deployment:
- [ ] Vercel account created
- [ ] Project deployed
- [ ] Environment variables added
- [ ] Build successful

### Domain Setup:
- [ ] Domain added to Vercel
- [ ] Nameservers updated (or DNS records)
- [ ] DNS propagation complete
- [ ] SSL certificate active

### Firebase:
- [ ] Authorized domains added
- [ ] Authentication working
- [ ] Firestore rules updated

### Testing:
- [ ] Domain opens
- [ ] HTTPS working
- [ ] Registration works
- [ ] Login works
- [ ] Admin panel works
- [ ] Mobile tested

### Post-Launch:
- [ ] Analytics setup
- [ ] Monitoring setup
- [ ] Social media updated
- [ ] Marketing started

---

## 🚀 Ready to Go Live!

**Total Time**: 15 minutes + DNS propagation (24-48 hours)
**Cost**: FREE (domain already purchased)
**Difficulty**: Easy

### Your Custom Domain Will Be Live Soon! 🎊

---

**Created by Yogendra Pratap Singh**
**UP Exam Mantra - UP Exams Made Easy**
